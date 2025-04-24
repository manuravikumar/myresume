const { DefaultAzureCredential } = require("@azure/identity");
const { LogsQueryClient } = require("@azure/monitor-query");

module.exports = async function (context, req) {
  const credential = new DefaultAzureCredential();
  const client = new LogsQueryClient(credential);

  const workspaceId = "587a2689-7f12-4f89-9b1b-4b2b3d346263";

  const query = `
    AzureCdnAccessLog
    | where TimeGenerated > ago(1d)
    | summarize total_hits = count()
  `;

  try {
    const result = await client.queryWorkspace(workspaceId, query, { duration: "PT24H" });
    const count = result?.tables?.[0]?.rows?.[0]?.[0] || 0;

    context.res = {
      status: 200,
      headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
      body: { visitors: count }
    };
  } catch (error) {
    context.res = {
      status: 500,
      body: { error: error.message }
    };
  }
};
