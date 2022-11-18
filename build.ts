// https://github.com/dagger/dagger/blob/79faf032be522d03ea215874df2cb2c147881c79/docs/current/sdk/nodejs/snippets/get-started/step3/build.ts

import Client, { connect } from "@dagger.io/dagger"

// initialize Dagger client
connect(async (client: Client) => {
  // get Node image
  // get Node version
  const node = await client.container().from("node:16").exec(["node", "-v"])

  // execute
  const version = await node.stdout().contents()

  // print output
  console.log("Hello from Dagger and Node " + version.contents)
})
