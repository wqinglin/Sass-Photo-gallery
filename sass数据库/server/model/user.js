module.exports = (sequelize, DataTypes) => {
  const userModel = sequelize.define("user", {
    id: {
      type: DataTypes.INTEGER(10),
      primaryKey: true,
      autoIncrement: true
    },
    username: {
      type: DataTypes.STRING(50),
      allowNull: false,
      unique: true,
      comment: "用户名"
    },
    password: {
      type: DataTypes.STRING(50),
      allowNull: false,
      comment: "密码"
    },
    mobile: {
      type: DataTypes.STRING(30),
      allowNull: true,
      comment: "手机号"
    },
    nickname:{
      type: DataTypes.STRING(30),
      allowNull: true,
      comment: "昵称"
    },
    gender:{
      type: DataTypes.ENUM('男', '女', '保密'),
      allowNull: false,
      defaultValue:'男',
      comment: "头像"
    },
    avatar:{
      type: DataTypes.STRING(80),
      allowNull: false,
      defaultValue:'https://z3.ax1x.com/2021/07/14/WVjYZj.png',
      comment: "头像"
    },
  });
  return userModel;
};