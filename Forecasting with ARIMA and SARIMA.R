# Install & Load required package
#install.packages("forecast")
library(forecast)

# 🔹 1️⃣    Create simple time series data
sales <- c(50, 52, 55, 57, 60, 62, 64, 67, 70, 72)
ts_sales <- ts(sales)
ts_sales




# 🔹 2️⃣   AR (AutoRegressive)
fit_ar <- Arima(ts_sales, order = c(1, 0, 0))
cat("\n---- AR(1) ----\n")
print(summary(fit_ar))


plot(forecast(fit_ar, h=3), main="AR(1) Forecast")


# 🔹 3️⃣    MA (Moving Average)
fit_ma <- Arima(ts_sales, order = c(0, 0, 1))
cat("\n---- MA(1) ----\n")
print(summary(fit_ma))


plot(forecast(fit_ma, h=3), main="MA(1) Forecast")


# 🔹 4️⃣    ARMA (AR + MA)
fit_arma <- Arima(ts_sales, order = c(1, 0, 1))
cat("\n---- ARMA(1,1) ----\n")
print(summary(fit_arma))



plot(forecast(fit_arma, h=3), main="ARMA(1,1) Forecast")


# 🔹 5️⃣ ARIMA (handles trend)
fit_arima <- Arima(ts_sales, order = c(1, 1, 1))
cat("\n---- ARIMA(1,1,1) ----\n")
print(summary(fit_arima))



plot(forecast(fit_arima, h=3), main="ARIMA(1,1,1) Forecast")


# 🔹 6️⃣    SARIMA (trend + seasonality)
# Example: monthly data with yearly seasonality
icecream <- c(100,120,150,200,300,400,500,450,300,200,150,120,
              130,150,180,220,320,420,520,460,310,210,160,130)
ts_icecream <- ts(icecream, frequency = 12, start = c(2023,1))
ts_icecream

fit_sarima <- Arima(ts_icecream, order = c(1,1,1), seasonal = c(0,1,1))
cat("\n---- SARIMA(1,1,1)(1,1,0)[12] ----\n")
print(summary(fit_sarima))



plot(forecast(fit_sarima, h=12), main="SARIMA(1,1,1)(1,1,0)[12] Forecast")





