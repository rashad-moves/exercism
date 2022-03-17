// @ts-check

const HOURS_PER_DAY = 8;

/**
 * The day rate, given a rate per hour
 *
 * @param {number} ratePerHour
 * @returns {number} the rate per day
 */
export function dayRate(ratePerHour) {
  return ratePerHour * HOURS_PER_DAY;
}

/**
 * Calculates the number of days in a budget, rounded down
 *
 * @param {number} budget: the total budget
 * @param {number} ratePerHour: the rate per hour
 * @returns {number} the number of days
 */
export function daysInBudget(budget, ratePerHour) {
  return Math.floor(budget / dayRate(ratePerHour));
}

/**
 * Calculates the discounted rate for large projects, rounded up
 *
 * @param {number} ratePerHour
 * @param {number} numDays: number of days the project spans
 * @param {number} discount: for example 20% written as 0.2
 * @returns {number} the rounded up discounted rate
 */
export function priceWithMonthlyDiscount(ratePerHour, numDays, discount) {
  var result;
  const BILLABLE_DAYS_PER_MONTH = 22;
  const discountedDays = Math.floor(numDays / BILLABLE_DAYS_PER_MONTH) * BILLABLE_DAYS_PER_MONTH;
  const nonDiscountedDays = numDays - discountedDays;

  const nonDiscountPrice = dayRate(ratePerHour) * nonDiscountedDays; 
  const discountPrice = dayRate(ratePerHour) * discountedDays * discount;

  result = nonDiscountPrice + discountPrice;
  result = Math.ceil(result);

  return result;
}
