const { query } = require('../database');
const { EMPTY_RESULT_ERROR, SQL_ERROR_CODE, UNIQUE_VIOLATION_ERROR } = require('../errors');

const { PrismaClient, Prisma } = require('@prisma/client');
const prisma = new PrismaClient();

module.exports.create = function create(code, name, credit) {
return prisma.module.create({
    data: { modCode: code, modName: name, creditUnit: parseInt(credit) }
}).then(function (module) {
    return module;
}).catch(function (error) {
    if (error instanceof Prisma.PrismaClientKnownRequestError) {
    if (error.code === 'P2002') {
    console.log('There is a unique constraint violation')
    }
}
    throw error;
});
};

module.exports.retrieveByCode = function retrieveByCode(code) {
    return prisma.module.findUnique({
    where: { modCode: code }
}).then(function (module) {
    return module;
}).catch(function (error) {
    if (error instanceof Prisma.PrismaClientKnownRequestError) {
    if (error.code === 'P2005') {
    console.log('There is a unique constraint violation')
    }
}
    throw error;
});
};

module.exports.deleteByCode = function deleteByCode(code) {
return prisma.module.delete({
    where: { modCode: code }
}).then(function (module) {

}).catch(function (error) {
    if (error instanceof Prisma.PrismaClientKnownRequestError) {
    if (error.code === 'P2005') {
    console.log('There is a unique constraint violation')
    }
}
    throw error;
})
};

module.exports.updateByCode = function updateByCode(code, credit) {
return prisma.module.update({
    where: { modCode: code },
    data: { creditUnit: parseInt(credit) }
}).then(function (module) {
}).catch(function (error) {
    if (error instanceof Prisma.PrismaClientKnownRequestError) {
    if (error.code === 'P2005') {
    console.log('There is a unique constraint violation')
    }
}
    throw error;
});
};

module.exports.retrieveAll = function retrieveAll() {
    return prisma.module.findMany();
};

module.exports.retrieveBulk = function retrieveBulk(codes) {
    const sql = 'SELECT * FROM module WHERE code IN ($1)';
    return query(sql, [codes]).then(function (response) {
        const rows = response.rows;
        const result = {};
        for (let i = 0; i < rows.length; i += 1) {
            const row = rows[i];
            const code = row.code;
            result[code] = row;
        }
        return result;
    });
};
