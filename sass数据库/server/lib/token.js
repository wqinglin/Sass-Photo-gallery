const jwt = require("jsonwebtoken");  // jwt 的 token 验证
const { secret } = require("../config");
// 生成token
exports.createToken = async (data, expiresIn= 3) => {
  return await jwt.sign({ mobile: data }, secret, {
    expiresIn: expiresIn, // 24 hours
  });
};
// 获取请求头部的authorization是否携带了token
exports.verify = async ctx => {
  let authorization = ctx.header.authorization;  // 客户端传来的token 
  if (authorization) {
    let token = authorization.split(" ")[1];
    try {
      let payload = jwt.verify(token, secret);
      return payload;  // 布尔值
    } catch (e) {
      return {
        auth: 0
      };
    }
  } else {
    return false;
  }
};
