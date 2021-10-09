module.exports = (sequelize, DataTypes) => {
    const myModel = sequelize.define('my', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        coupons: {
            type: DataTypes.INTEGER,
            defaultValue: 0,
            comment: "优惠券"
        },
        mark: {
            type: DataTypes.INTEGER,
            defaultValue: 0,
            comment: "纪念值"
        },
        medal: {
            type: DataTypes.INTEGER,
            defaultValue: 0,
            comment: "勋章"
        },
        gift: {
            type: DataTypes.INTEGER,
            defaultValue: 0,
            comment: "礼品卡"
        },
        name: {
            type: DataTypes.STRING,
            allowNull: false,
            comment: '名称'
        },
        imgurl: {
            type: DataTypes.STRING,
            allowNull: false,
            comment: '关于我们'
        },
        order: {
            type: DataTypes.INTEGER,
            allowNull: false,
            defaultValue: 0,
            comment: '排序'
        }
    })
    return myModel
}
