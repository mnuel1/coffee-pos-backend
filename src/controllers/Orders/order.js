const db = require("../../database/db")


const CreateOrder = async (req, res) => {
    const connection = await db.getConnection();
    
    try {

        const { order_payload, order_items_id } = req.body

        await connection.beginTransaction()
    
        const [ result ] = await connection.query(
            `INSERT INTO orders (total_amt, order_type, payment_type) VALUES (?, ?, ?)`,
            [order_payload.total_amt, order_payload.order_type, order_payload.payment_type]
        )

        const orderId = result.insertId
      
        for (const item of order_items_id) {
            await connection.query(
                `INSERT INTO order_items (order_id, item_id) VALUES (?, ?)`,
                [orderId, item] 
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
                            'Order Item ID": "', order_items.order_item_id, '",',
                            '"Item ID": "', order_items.item_id, '",',
                            '"Item Name": "', order_items.item_name, '",',
                            '"Item Quantity": "', order_items.item_quantity, '",',
                            '"Item Price": "', order_items.item_price, '",',
                            '"Item Total Price": "', order_items.item_total, '"',
                        '}'
                    )
                    SEPARATOR ','
                ) AS items
            FROM orders
            LEFT JOIN order_items
            ON orders.order_id = order_items.order_id
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
                            'Order Item ID": "', order_items.order_item_id, '",',
                            '"Item ID": "', order_items.item_id, '",',
                            '"Item Name": "', order_items.item_name, '",',
                            '"Item Quantity": "', order_items.item_quantity, '",',
                            '"Item Price": "', order_items.item_price, '",',
                            '"Item Total Price": "', order_items.item_total, '"',
                        '}'
                    )
                    SEPARATOR ','
                ) AS items
            FROM orders
            LEFT JOIN order_items
            ON orders.order_id = order_items.order_id
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

module.exports = {
    CreateOrder,
    UpdateOrder,
    DeleteOrder,
    GetOrder,
    GetOrders
}
