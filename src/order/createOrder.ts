import { Request, Response } from "express";

import { db } from "../db/db";

async function getOrderNo(
    customer_id: Number,
    payment_type: String,
    total: Number
) {
    const query = `
        SELECT "ORDER-"
            || $1
            || "-"
            || SELECT to_char("date", 'DDMMYY')
            || SELECT nextval("order_id_seq");
    `;

    return db.none(query, [customer_id, payment_type, total]);
}

async function createOrder(req: Request, res: Response) {
    const { customer_id, payment_type, total, items } = req.body;

    const order = {
        no_order: getOrderNo(customer_id, payment_type, total),
        id_customer: customer_id,
        payment_type: payment_type,
        items: items,
        total: total,
        status: "Order Diterima"
    };

    const fs = require("fs");

    fs.writeFile("../database/customer_order", order, "utf8")
}

export { createOrder };