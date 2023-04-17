/** @type {import('tailwindcss').Config} */

const colors = require("tailwindcss/colors");
export default {
  content: ["./index.html", "./src/**/*.{vue,js,ts,jsx,tsx}"],
  theme: {
    extend: {},
    colors: {
      aero: "#00b3e1",
      "pacific-cyan": "#00a5cf",
      "bondi-blue": "#0091b7",
      transparent: "transparent",
      ...colors,
    },
  },
  plugins: [],
};
