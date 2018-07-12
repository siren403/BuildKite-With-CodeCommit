# codecommit-buildkite

AWS Lambda script to create Buildkite builds when code is pushed to AWS CodeCommit

## Building

```
yarn install
yarn build
```

## Uploading to AWS

1. Go to Lambda AWS console
2. Create function
3. Author from scratch
4. Add a name of your choosing
5. Set runtime to Node 8.10
6. Create a custom role
7. Add a role name of your choosing
8. View policy document -> Edit -> Ok, paste this policy:
    ```json
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "codecommit:GetCommit"
                ],
                "Resource": "arn:aws:codecommit:*:*:*"
            }
        ]
    }
    ```
9. Allow
10. Create function
11. Code entry type - change to "Upload a .ZIP file"
12. Upload `codecommit-buildkite.zip`
13. Add environment variables:
    * BUILDKITE_ORG: slug for your buildkite account
    * BUILDKITE_PIPELINE: slug for the pipeline to build on
    * BUILDKITE_TOKEN: API token - create it under Personal Settings -> API Access Tokens, and give it permission to modify builds
14. Add triggers -> CodeCommit
15. Select repository to watch
16. Fill in trigger name of "buildkite" (or whatever makes sense to you, this is the name you will see when you browse triggers in CodeCommit)
17. Remove the "All repository events" event type, and add "Create branch or tag" and "Push to existing branch"
18. Add the trigger
19. Save
