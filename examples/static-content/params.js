"use strict"
import fs from 'fs';

const sitemap = JSON.parse(fs.readFileSync('./data/sitemap.json'));

const params = {
    sitemap: sitemap
};

export {
    params as params
};