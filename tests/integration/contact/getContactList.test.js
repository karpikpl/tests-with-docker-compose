const fetch = require('node-fetch');
const host = process.env.host;

describe('get all contacts integration tests', () => {
  it('should return 200 when data in the DB', async () => {
    // arrange

    // act
    const response = await fetch(host + '/api/contacts');
    const result = await response.json();

    // assert
    expect(result.result.length).toBe(6);
    expect(response.status).toBe(200);
    expect(result.result[0].FIRSTNAME).toBe('John');
  });
});
