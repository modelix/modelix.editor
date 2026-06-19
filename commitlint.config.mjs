export default {
    extends: ["@commitlint/config-conventional"],
    rules: {
        "scope-enum": [
            2,
            "always",
            [
                "deps",
                "projectional-editor",
                "mps-plugin",
                "interpreter",
                "react"
            ],
        ],
        "subject-case": [0, 'never'],
        "body-max-line-length": [0, 'always'],
        "footer-max-line-length": [0, 'always']
    },
    ignores: [
        (message) => message.includes('skip-lint')
    ],
};
