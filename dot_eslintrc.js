module.exports = {
	root: true,
	env: {
		node: true,
		browser: true,
		es6: true,
	},
	extends: [
		'eslint:recommended',
	],
	rules: {
		'semi': ['error', 'always'],
	},
};
