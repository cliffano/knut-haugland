"use strict"
import fs from 'fs';

const sitemap = JSON.parse(fs.readFileSync('./data/sitemap.json'));

const params = {
    sitemap: sitemap,
    redirect_url:'https://google.com'
};

export {
    params as params
};