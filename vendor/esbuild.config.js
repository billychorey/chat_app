const esbuild = require('esbuild');

esbuild.build({
  entryPoints: ['app/javascript/application.js'], // Adjust this path to your entry point
  bundle: true,
  outdir: 'app/assets/builds', // Output directory for compiled assets
  watch: process.argv.includes('--watch'),
  loader: { '.js': 'jsx', '.css': 'css' },
  logLevel: 'info',
}).catch(() => process.exit(1));
