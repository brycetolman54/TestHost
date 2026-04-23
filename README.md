# Vercel and GitHub Pages

This is a simple project that I am working on to figure out how to get Vercel (back end) and GitHub Pages (front end) to work together.

The reason for this is that I want to be able to create hobby sites for free, and with this set up I will be able to do so.

The layout I have is as follows:
- `main` branch: holds all of the code
- `web` branch: holds the HTML, JS, and CSS files for the front end (GitHub Pages)
  - The plan is to have just one of each file, a la React style
- `server` branch: holds the JS functions to be used for the back end (Vercel)
  - Right now they are serverless functions.
  - If I ever need them to be a server, I would just do some express magic.

I am also using this as an opportunity to learn how to work with `npm` and `React`, though those are secondary goals.

I have some scripts that I created to help me easily deploy to GitHub Pages and Vercel (by deploy I mean push the right code to the right branches so
that those sites can do what they do and make my code show up).

I will make this repo a template repo so that I can just use it fresh with any new projects, though I will probably write instructions on how to make
it anew in case I ever need to do so.

I will also write something about how to actually set up Vercel and GitHub Pages.

Bryce
