exports.dismantle = function (secret) {
  return function (shares) {
    return function (threshold) {
      return function () {
        var a = require("shamirs-secret-sharing").split(secret, {
          shares: shares,
          threshold: threshold,
        });
        return a;
      };
    };
  };
};

exports.assemble = function (shares) {
  return function () {
    return require("shamirs-secret-sharing").combine(shares);
  };
};
