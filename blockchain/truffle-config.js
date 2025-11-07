module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*",
      gas:6500000,
      from:"0xd0bE8937eC945304ba8006FBd58A1193C9934A32",

   
    },
  },
  contracts_directory: './testing/',
  contracts_build_directory: './src/build/',
  compilers: {
    solc: {
      version: "0.6.6",
      settings: {
        optimizer: {
          enabled: true,
          runs: 100
        }
      }
    }
  }
}