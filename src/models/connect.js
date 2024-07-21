import {Sequelize} from 'sequelize'

const sequelize = new Sequelize("db_restaurant","root","123456",{
    host:"localhost",
    port:"3307",
    dialect:"mysql"
})

// try {
//     await sequelize.authenticate()
//     console.log("Thành công")
// } catch {
//     console.log("thất bại")
// }

export default sequelize;