const db = require("../../database/db")


const CreateOrder = async (req, res) => {
    const connection = await db.getConnection();
    
    try {

        const { order, order_items } = req.body

        await connection.beginTransaction()
    
        const [ result ] = await connection.query(
            `INSERT INTO orders (customer_name, customer_msg, total_amt, order_type, payment_type) VALUES (?, ?, ?, ?, ?)`,
            [order.customer_name, order.customer_msg,  order.total_amt, order.order_type, order.payment_type]
        )

        const orderId = result.insertId
      
        for (const item of order_items) {
            await connection.query(
                `INSERT INTO order_beverages (order_id, beverage_id, sugar_level, size, item_price, item_quantity, item_total) VALUES (?, ?, ?, ?, ?, ?, ?)`,
                [orderId, item.beverage_id, item.sugar_level, item.size, item.price, item.quantity, item.total] 
            );
        }

        await connection.commit();

        return res.status(200).json({ 
            title: "Order in Progress", 
            message: "Your order has been sent to the kitchen. Please hold on while we prepare it.", 
        });

    } catch (error) {
        await connection.rollback();
        console.error(error)
        return res.status(500).json({ 
            title: "Internal Server Error", 
            message: "Something went wrong. Please Try again", 
        });
    } 


}

const UpdateOrder = async (req, res) => {

/*
 * NOT YET SURE IF ORDER CAN BE UPDATED 
 */
    
}

const DeleteOrder = async (req, res) => {

    try {

        const { order_id } = req.params

        const isVoid = true;

        const [result] = await db.query(
            "UPDATE orders SET isVoid = ? WHERE order_id = ?",
            [isVoid, order_id]
        )

        if (!result) {
            return res.status(404).json({ 
                title: "Not Found", 
                message: "You are trying to void an order that don't exist" 
            });
        }

        return res.status(200).json({ 
            title: "Success", 
            message: "nice"
        });

    } catch (error) {
        console.error(error)
        return res.status(500).json({ 
            title: "Internal Server Error", 
            message: "Something went wrong. Please Try again", 
        });
    }

    
}

const GetOrder = async (req, res) => {

    try {

        const { order_id } = req.params
        
        const [result] = await db.query(
            `SELECT 
                orders.*,
                GROUP_CONCAT(
                    CONCAT(
                        '{"',
                            'Beverage ID": "', beverages.beverage_id, '",',                            
                            '"Name": "', beverages.name, '",',
                            '"Description": "', beverages.description, '",',
                            '"Sugar Level": "', order_beverages.sugar_level, '",',
                            '"Price": "', order_beverages.item_price, '",',       
                            '"Quantity": "', order_beverages.item_quantity, '",',                     
                            '"Total Price": "', order_beverages.item_total, '"',
                        '}'
                    )
                    SEPARATOR ','
                ) AS items
            FROM orders
            LEFT JOIN order_beverages ON orders.order_id = order_beverages.order_id
            LEFT JOIN beverages ON beverages.beverage_id = order_beverages.beverage_id
            WHERE orders.order_id = ? AND isVoid != true
            GROUP BY orders.order_id`,
            [order_id]
        );
                   
        const jsonItemsFormat = JSON.parse(`[${result[0].items}]`)
        
        result[0].items = jsonItemsFormat
      
        
        if (!result) {
            return res.status(404).json({ 
                title: "Not Found", 
                message: "Order don't exist." 
            });
        }
        
        return res.status(200).json({ 
            title: "Success", 
            message: "nice",
            order: result[0], 

        });

    } catch (error) {
        console.error(error)
        return res.status(500).json({ 
            title: "Internal Server Error", 
            message: "Something went wrong. Please Try again", 
        });
    }            
}

const GetOrders = async (req, res) => {
    
    try {    
        const [result] = await db.query(
            `SELECT 
                orders.*,                
                GROUP_CONCAT(
                    CONCAT(
                        '{"',
                            'Beverage ID": "', beverages.beverage_id, '",',                            
                            '"Name": "', beverages.name, '",',
                            '"Description": "', beverages.description, '",',
                            '"Sugar Level": "', order_beverages.sugar_level, '",',
                            '"Price": "', order_beverages.item_price, '",',       
                            '"Quantity": "', order_beverages.item_quantity, '",',                     
                            '"Total Price": "', order_beverages.item_total, '"',
                        '}'
                    )
                    SEPARATOR ','
                ) AS items
            FROM orders
            LEFT JOIN order_beverages ON orders.order_id = order_beverages.order_id
            LEFT JOIN beverages ON beverages.beverage_id = order_beverages.beverage_id
            WHERE isVoid != true
            GROUP BY orders.order_id`
        );
                   
        result.forEach((item) => {
            item.items = JSON.parse(`[${item.items}]`);
        });

      
        if (!result) {
            return res.status(404).json({ 
                title: "No orders found", 
                message: "Theres 0 orders yet" 
            });
        }
        
        return res.status(200).json({ 
            title: "Success", 
            message: "nice", 
            orders: result,
        });
    } catch (error) {
        console.error(error)
        return res.status(500).json({ 
            title: "Internal Server Error", 
            message: "Something went wrong. Please Try again",            
        });
    }        
}

async function GetNewOrders() {    
    const [rows] = await db.execute(
        `SELECT 
            orders.*,
            GROUP_CONCAT(
                    CONCAT(
                        '{"',
                            'Beverage ID": "', beverages.beverage_id, '",',                            
                            '"Name": "', beverages.name, '",',
                            '"Description": "', beverages.description, '",',
                            '"Sugar Level": "', order_beverages.sugar_level, '",',
                            '"Price": "', order_beverages.item_price, '",',       
                            '"Quantity": "', order_beverages.item_quantity, '",',                     
                            '"Total Price": "', order_beverages.item_total, '"',
                        '}'
                    )
                    SEPARATOR ','
                ) AS items
        FROM orders
        LEFT JOIN order_beverages ON orders.order_id = order_beverages.order_id
        LEFT JOIN beverages ON beverages.beverage_id = order_beverages.beverage_id
        WHERE isVoid != true AND order_status = 'Preparing'
        GROUP BY orders.order_id
        ORDER BY orders.created_time DESC;`
    ); 
    
    rows.forEach((item) => {
        item.items = JSON.parse(`[${item.items}]`);
    });

    return rows;
}

module.exports = {
    CreateOrder,
    UpdateOrder,
    DeleteOrder,
    GetOrder,
    GetOrders,
    GetNewOrders
}
