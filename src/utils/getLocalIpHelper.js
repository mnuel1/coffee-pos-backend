const os = require('os');

function getLocalIpAddress() {
  const interfaces = os.networkInterfaces();
  for (const interfaceName of Object.keys(interfaces)) {
    for (const iface of interfaces[interfaceName]) {
      if (iface.family === 'IPv4' && !iface.internal) {
        console.log(iface.address)
        return iface.address;
      }
    }
  }
  return 'localhost'; 
}

module.exports = getLocalIpAddress;
