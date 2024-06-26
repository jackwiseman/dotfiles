module.exports = {
	root: true,
	env: {
		node: true,
		browser: true,
		es6: true,
	},
    parserOptions: {
        ecmaVersion: 8
    },
	extends: [
		'eslint:recommended',
	],
	rules: {
		'semi': ['error', 'always'],
	},
};
