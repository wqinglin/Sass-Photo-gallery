module.exports = (sequelize, DataTypes) => {
    const goodscategoryModel = sequelize.define('goodscategory', {
        id: {
            type: DataTypes.INTEGER(10),
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: DataTypes.STRING(50),
            allowNull: false,
            comment: '商品名称'
        },
        imgurl: {
            type: DataTypes.STRING(100),
            allowNull: false,
            comment: '商品封面'
        },
        content: {
            type: DataTypes.TEXT,
            allowNull: false,
            comment: "商品内容介绍",
        },
        readCount: {
            type: DataTypes.INTEGER(10),
            defaultValue: 0,
            comment: "购买人数",
        },
        ori_price: {
            type: DataTypes.DECIMAL(10, 2),
            allowNull: false,
            defaultValue: 0,
            comment: "原价",
        },
        price: {
            type: DataTypes.DECIMAL(10, 2),
            allowNull: false,
            defaultValue: 0,
            comment: "打折价格",
        },
        is_special: {
            type: DataTypes.INTEGER(3),
            defaultValue: 0,
            comment: "推荐课程",
        },
        is_on: {
            type: DataTypes.INTEGER(3),
            defaultValue: 1,
            comment: "上架或下架",
        },
        order: {
            type: DataTypes.INTEGER(10),
            allowNull: false,
            defaultValue: 0,
            comment: '排序'
        }

    })
    // goodscategoryModel.associate = (models) => {
    //     goodscategoryModel.belongsTo(models.goodscolomnModel) &&
    //         goodscategoryModel.belongsTo(models.categoryModel)
    // }
    return goodscategoryModel
}
