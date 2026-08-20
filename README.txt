Storymap export package

This zip is for two uses:
1. View — unzip and open index.html via a local static server
   (required for fetch("story.json")). Example: npx serve .
2. Edit — in the Storymap Engine, use Import zip. Modules, headings,
   and section nav come back as they were when you exported.

Contents:
- index.html (simple reader)
- story.json (full story + modules; wrapped as nybg-storymap)
- css/reader.css
- js/reader.js
- assets-cdn.json (CloudFront base: https://d3cirt5a0e133s.cloudfront.net)
- images/ and maps/ paths in story.json are resolved via assets-cdn.json
  on the publisher site. Uploaded-in-editor photos may still appear under
  images/ in this zip.

If this zip is larger than 25 MB:
Put large assets on the storymap-assets S3 bucket under images/ or maps/
(same relative paths as in the story). Confirm the CloudFront base in
the Export dialog before downloading.

MapLibre, pmtiles, and shpjs load from CDN.