const db = require("../../database/db");

const ProcessPayment = async (req, res) => {
  const { receipt_url } = req.body;

  try {
    if (!receipt_url) {
      return res
        .status(401)
        .json({ title: "Receipt Error", message: "No Receipt " });
    }

    const [result] = await db.query(
      `INSERT INTO payment ( receipt_url ) VALUES ( ? )`,
      [receipt_url]
    );

    return res.status(200).json({
      title: "Success",
      message:
        "Payment process went through. Please wait for the confirmation of the cashier.",
      orders: result,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      title: "Internal Server Error",
      message: "Something went wrong. Please Try again",
    });
  }
};

const ConfirmPayment = async (req, res) => {
  const { paymentId } = req.body;
  console.log(
    `Received request to confirm payment with paymentId: ${paymentId}`
  );

  try {
    const currentTimestamp = new Date().toISOString();
    const paymentStatus = "Paid";
    const orderStatus = "Served";

    const [paymentResult] = await db.query(
      `UPDATE payment SET payment_status = ?, modified_time = ? WHERE payment_id = ?`,
      [paymentStatus, currentTimestamp, paymentId]
    );

    // Check if payment_id exists before updating orders
    if (paymentResult.affectedRows === 0) {
      return res.status(404).json({
        title: "Error",
        message: "Payment not found",
      });
    }

    const [orderResult] = await db.query(
      `UPDATE orders SET order_status = ? WHERE payment_id = ?`,
      [orderStatus, paymentId]
    );

    if (orderResult.affectedRows === 0) {
      return res.status(404).json({
        title: "Error",
        message: "Order not found",
      });
    }

    return res.status(200).json({
      title: "Success",
      message: "Payment confirmed by the cashier. Thank you!",
      payment: paymentResult,
      orders: orderResult,
    });
  } catch (error) {
    console.error(
      `Error confirming payment for paymentId: ${paymentId}`,
      error
    );
    return res.status(500).json({
      title: "Internal Server Error",
      message: "Something went wrong. Please try again",
    });
  }
};

const RefundPayment = async (req, res) => {};

const GetHistory = async (req, res) => {
  try {
    const [result] = await db.query(
      `SELECT 
                payment.*,
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
            FROM payment
            LEFT JOIN orders ON orders.payment_id = payment.payment_id  
            LEFT JOIN order_beverages ON orders.order_id = order_beverages.order_id
            LEFT JOIN beverages ON beverages.beverage_id = order_beverages.beverage_id     
            GROUP BY orders.payment_id`
    );

    result.forEach((item) => {
      item.items = JSON.parse(`[${item.items}]`);
    });

    return res.status(200).json({
      title: "Success",
      message: "history fetched",
      orders: result,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      title: "Internal Server Error",
      message: "Something went wrong. Please Try again",
    });
  }
};

async function GetPendingPayment() {
  const [rows] = await db.execute(
    `SELECT 
            payment.*,
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
        FROM payment
        LEFT JOIN orders ON orders.payment_id = payment.payment_id  
        LEFT JOIN order_beverages ON orders.order_id = order_beverages.order_id
        LEFT JOIN beverages ON beverages.beverage_id = order_beverages.beverage_id     
        GROUP BY orders.payment_id
        ORDER BY orders.modified_time DESC`
  );

  rows.forEach((item) => {
    item.items = JSON.parse(`[${item.items}]`);
  });

  return rows;
}

module.exports = {
  ProcessPayment,
  RefundPayment,
  GetHistory,
  ConfirmPayment,
  GetPendingPayment,
};
