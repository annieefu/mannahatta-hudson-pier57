# NYBG Storymap Pages Template

This Github template allows you to publish a finished storymap from the **Storymap Engine**. If you haven't yet, use the Storymap Engine to draft and export your storymap zip file, then use this template to publish it to a public GitHub Pages URL.

This was created by Annie Fu in August 2026.

Non-technical workflow:

1. Click **Use this template** → **Create a new repository**.
2. Name it with a slug specific to the story (for example `mannahatta-hudson-pier57`).
3. Drop your export zip into the new repo as `storymap-export.zip`.
4. Wait for GitHub Actions to unpack it and publish Pages.
5. Open the Pages URL in the Actions summary or under **Settings → Pages**.

## What you need

- A GitHub account
- A zip file exported from the Storymap Engine

## Step-by-step

### 1. Create a repo from this template

On this repository’s GitHub page:

1. Click the green **Use this template** button.
2. Choose **Create a new repository**.
3. Set a short name (letters, numbers, dashes).
4. Leave it **Public** if you want a public storymap URL.
5. Create the repository.

### 2. Add your export zip

1. In Storymap Engine, click **Export** and download the zip.
2. Rename that file to exactly:

   `storymap-export.zip`

3. In the new GitHub repo, click **Add file** → **Upload files**.
4. Drag `storymap-export.zip` onto the page.
5. Commit (message can be `Add storymap export`).

### 3. Wait for publish

This portion is largely automated by Github Actions!

GitHub Actions will:

1. Unzip the export into the site (keeping `.github` and this README document)
2. Commit the unpacked story files
3. Deploy GitHub Pages

When the **Import storymap zip** and **Deploy GitHub Pages** workflows are green, your story is live.

Typical URL shape:

`https://<org>.github.io/<repo-name>/`

Example: repo `mannahatta-hudson` → `https://nybg-conservation.github.io/mannahatta-hudson/`

### 4. Update later

In order to update the published story, make the edits in the Storymap engine and export again. Upload a new `storymap-export.zip` (same filename), and commit. The import workflow runs again and replaces the published story.

## Local preview (optional)

If you have the zip on your computer:

```bash
./scripts/import-export.sh path/to/your-export.zip
npx --yes serve .
```

Then open the URL printed in the terminal.

## What’s inside an export

The Storymap Engine zip already includes a polished reader:

- `index.html`
- `story.json`
- `css/`, `js/`
- `images/`, `maps/`, `fonts/` when used

This template only automates unpacking that package and hosting it on GitHub Pages.

## Troubleshooting

| Issue | What to try |
| --- | --- |
| Pages 404 | Wait for both Actions to finish; check **Settings → Pages** shows “GitHub Actions”. |
| Import failed | Zip must be named `storymap-export.zip` and must contain `story.json` + `index.html`. |
| Maps blank | Large PMTiles can take a minute; confirm `maps/` was committed (GitHub rejects files over 100 MB). |
| Want a custom domain | Set it under **Settings → Pages → Custom domain**. |

## For maintainers

- Template flag: this repo is marked as a **template repository**.
- Workflows live in `.github/workflows/`.
- Import commits with `github-actions[bot]`; Pages deploys from `main` after unpack.
