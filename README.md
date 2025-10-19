# Forecasting-with-ARIMA-and-SARIMA


This repository contains a single R script (` Forecasting-with-ARIMA-and-SARIMA`) demonstrating basic time series modeling and forecasting using the `forecast` package. The script covers simple examples of AR, MA, ARMA, ARIMA and SARIMA models and produces model summaries and forecasts with plots.

## Files
- `Forecasting with ARIMA and SARIMA` — R script with examples:
  - Creates a small toy sales time series
  - Fits AR(1), MA(1), ARMA(1,1), ARIMA(1,1,1)
  - Demonstrates a SARIMA model on a monthly ice cream sales example
  - Prints model summaries and plots forecasts

## Requirements
- R (>= 3.5)
- R package: forecast

Install the required package in R if you don't already have it:
```r
install.packages("forecast")
```

## Usage

Open R (or RStudio) and run the script:

Interactive (recommended, for plots):
```r
source("FORECASTING WITH ARIMA AND SARIMA")
```

Non-interactive (plots may not display depending on environment):
```bash
Rscript " Forecasting-with-ARIMA-and-SARIMA"
```

The script prints model summary output to the console and opens plot windows for each fitted model's forecasts.

## What the script does (section-by-section)

1. Create simple time series data
   - A toy `sales` vector is converted to a `ts` object: `ts_sales <- ts(sales)`

2. AR (AutoRegressive) — AR(1)
   - Fits `Arima(ts_sales, order = c(1, 0, 0))`
   - Prints summary and plots a 3-step forecast

3. MA (Moving Average) — MA(1)
   - Fits `Arima(ts_sales, order = c(0, 0, 1))`
   - Prints summary and plots a 3-step forecast

4. ARMA (AR + MA) — ARMA(1,1)
   - Fits `Arima(ts_sales, order = c(1, 0, 1))`
   - Prints summary and plots a 3-step forecast

5. ARIMA (handles trend) — ARIMA(1,1,1)
   - Fits `Arima(ts_sales, order = c(1, 1, 1))`
   - Prints summary and plots a 3-step forecast

6. SARIMA (seasonal) — example monthly ice cream sales
   - Builds a monthly time series `ts_icecream` with frequency = 12
   - Fits a SARIMA model with seasonal components
   - Prints summary and plots a 12-step (one-year) forecast

## Customization Tips

- Change forecast horizon: modify `h` inside `forecast(..., h = 3)` to the number of periods to forecast.
- Use your own data: replace the `sales` or `icecream` vectors with your own numeric vectors and set `ts(..., frequency = ...)` appropriately.
- Seasonal frequency: for weekly data with annual seasonality use `frequency = 52`; for quarterly use `frequency = 4`, etc.
- Automatic model selection: consider `auto.arima()` (from the `forecast` package) to select orders automatically:
  ```r
  auto_fit <- auto.arima(ts_sales)
  summary(auto_fit)
  ```

## Notes

- The script uses very small toy datasets for demonstration; results and diagnostics are primarily educational.
- For real datasets, check residual diagnostics, AIC/BIC, and prediction intervals before using forecasts operationally.
- Plots open in your R plotting device. If running headless (CI, servers), save plots to files using `png()`/`pdf()` devices.

## Example output (console)
You will see printed summaries similar to:
- Coefficients (AR/MA terms)
- sigma^2 (variance)
- AIC, BIC
- Ljung-Box test results (if present in diagnostics)

And forecast plots showing historical data with forecasted mean and prediction intervals.

## License
MIT License — see LICENSE file (or add one) if you want to include a formal license.

## Author / Contact
Created by alinapradhan  
GitHub: https://github.com/alinapradhan

If you want improvements (for example: more models, automated model selection, residual diagnostics, model comparison table, or saving plots), open an issue or send a PR.
