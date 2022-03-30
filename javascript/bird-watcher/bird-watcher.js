// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Calculates the total bird count.
 *
 * @param {number[]} birdsPerDay
 * @returns {number} total bird count
 */
export function totalBirdCount(birdsPerDay) {
  let result = 0;
  for (let i = 0; i < birdsPerDay.length; i++) {
    result += birdsPerDay[i];
  }
  return result;
}

/**
 * Calculates the total number of birds seen in a specific week.
 *
 * @param {number[]} birdsPerDay
 * @param {number} week
 * @returns {number} birds counted in the given week
 */
export function birdsInWeek(birdsPerDay, week) {
  let result = 0;
  const start = (week-1) * 7;
  const birdsInWeek = birdsPerDay.slice(start,start+7);
  for (let i = 0; i < birdsInWeek.length; i++) {
    result += birdsInWeek[i];
  }
  return result;
}

/**
 * Fixes the counting mistake by increasing the bird count
 * by one for every second day.
 *
 * @param {number[]} birdsPerDay
 * @returns {number[]} corrected bird count data
 */
export function fixBirdCountLog(birdsPerDay) {
  for (let i = 0; i < birdsPerDay.length; i+=2) {
    birdsPerDay[i]++;
  }
  return birdsPerDay;
}
