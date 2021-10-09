module.exports = (sequelize, DataTypes) => {
    const activitiesModel = sequelize.define('activities', {
        id: {
            type: DataTypes.INTEGER(10),
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: DataTypes.STRING(50),
            allowNull: false,
            comment: '活动主题'
        },
        description: {
            type: DataTypes.STRING(100),
            allowNull: true,
            comment: "活动介绍",
        },
        imgurl: {
            type: DataTypes.STRING(50),
            allowNull: false,
            comment: '活动图像'
        },
        order: {
            type: DataTypes.INTEGER(10),
            allowNull: false,
            defaultValue: 0,
            comment: '排序'
        }

    })

    return activitiesModel
}
