const sql = require('mssql');

const database = process.env['sqlDatabase'];
const host = process.env['sqlServer'];
const port = process.env['sqlPort'];
const username = process.env['sqlUsername'];
const password = process.env['sqlPassword'];

async function getData(context) {
  try {
    // make sure that any items are correctly URL encoded in the connection string
    const cs = `mssql://${username}:${password}@${host}:${port}/${database}`;
    await sql.connect(cs);
    context.log(
      `executing {select from dbo.Contact} agaist ${host}:${port}/${database}`
    );
    const result = await sql.query`select * from dbo.Contact`;

    return result;
  } catch (err) {
    context.log.error(err);
  }
}

// signature is (context, input)
module.exports = async function (context) {
  context.log(
    `Executing ${context.executionContext.functionName} id: ${context.invocationId}`
  );

  const data = await getData(context);

  return {
    status: data.recordset,
    body: {
      result: data.recordset,
    },
    headers: { 'content-type': 'application/json; charset: UTF8' },
  };
};
