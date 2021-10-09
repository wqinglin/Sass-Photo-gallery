module.exports = (sequelize, DataTypes) => {
    const goodscolomnModel = sequelize.define('goodscolomn', {
        id: {
            type: DataTypes.INTEGER(10),
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: DataTypes.STRING(50),
            allowNull: false,
            comment: '商品栏目'
        },
        imgurl:{
            type: DataTypes.TEXT,
            allowNull: false,
            comment: '商品栏目图像'
        },
        order: {
            type: DataTypes.INTEGER(10),
            allowNull: false,
            defaultValue:0,
            comment: '排序'
        }

    })
    // goodscolomnModel.associate = (models) => {
    //     goodscolomnModel.belongsTo(models.categoryModel)&&
    //       goodscolomnModel.hasMany(models.goodscategoryModel)
      
    // }
    return goodscolomnModel
} 
