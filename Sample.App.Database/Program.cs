using System;
using System.Data.SqlClient;
using System.Threading;
using DbUp;

namespace Sample.App.Database
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length != 1)
            {
                Console.Error.WriteLine($"Expecting a single connection string argument but received {args.Length} argument(s).");
                Environment.Exit(-1);
                return;
            }

            var connectionString = args[0];

            ExecuteWithRetry(
                () => EnsureDatabase.For.SqlDatabase(connectionString),
                retryCondition: ex => ex is SqlException sqlEx && (sqlEx.Number == 17187 || sqlEx.Number == 18456),
                onRetry: (ex, attempts, maxTimes, delay) => Console.WriteLine($"SQL Server is not ready. Retry {attempts}/{maxTimes} in {delay}ms"),
                maxAttempts: 10,
                delay: 1000);


            var dbup = DeployChanges.To
                .SqlDatabase(connectionString)
                .LogToConsole()
                .LogScriptOutput()
                .WithExecutionTimeout(TimeSpan.FromSeconds(30))
                .WithScriptsFromFileSystem("./scripts")
                .Build();


            var result = dbup.PerformUpgrade();

            if (!result.Successful)
            {
                Console.Error.WriteLine(result.Error);
                Environment.Exit(-1);
            }
        }

        static void ExecuteWithRetry(Action action, Func<Exception, bool> retryCondition, Action<Exception, int, int, int> onRetry, int maxAttempts, int delay)
        {
            var attempts = 0;
            while (attempts <= maxAttempts)
            {
                attempts++;
                try
                {
                    action();
                }
                catch (Exception ex) when (attempts < maxAttempts && retryCondition(ex))
                {
                    onRetry(ex, attempts, maxAttempts, delay);
                    Thread.Sleep(delay);
                }
            }
        }
    }
}
