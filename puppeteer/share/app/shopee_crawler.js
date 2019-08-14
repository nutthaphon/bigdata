const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({args: ['--no-sandbox', '--disable-setuid-sandbox']});
  const page = await browser.newPage();
  await page.goto('https://shopee.co.th/search?keyword=sonoff&page=0&sortBy=sales', {waitUntil: 'networkidle2'});
  await page.pdf({path: 'shopee_sonoff_sales.pdf', format: 'A4'});

  await browser.close();
})();