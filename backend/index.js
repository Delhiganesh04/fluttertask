const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const productRoutes = require("./routes/productRoutes");

const app = express();
const PORT = 3000;
require("dotenv").config();

// Middleware
app.use(cors());
app.use(express.json());

// Connect to MongoDB
mongoose.connect(process.env.MONGO_URI)
.then(() => console.log("MongoDB connected"))
.catch((err) => console.error("MongoDB connection error:", err));

// Routes
app.use("/products", productRoutes);

// Start server
// app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
const ip = require('ip');
app.listen(3000, ip.address(), () => {
  console.log(`Server running at http://${ip.address()}:3000`);
});
