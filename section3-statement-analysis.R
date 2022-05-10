##Requirement:
# results in vector
# no decimal points

#Functions:
# round()
# mean()
# max()
# min()

#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

##Calculate the following:
# profit each month
profit <- revenue - expenses
profit

# profit after tax each month (30% rate)

tax <- round(profit * 0.3,digits=2)
tax

profit.after.tax <- profit - tax
profit.after.tax
# profit margin each month
profit.margin <- round(profit.after.tax / revenue,2) *100
profit.margin

# good months

# bad months
# the best month
# the worst month