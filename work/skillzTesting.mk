# Skillz CAP Testing Strategy

We have three main areas we need to subset test, starting a few apps at a time. The order of operations is important to ensure we’ve addressed any potential issues.

### 1. IDLink Logic Testing

We will begin by testing our new IDLink logic. This will involve collaborating with CSMs and Skillz to identify an app, or a small group of apps, for a gradual rollout into production. To confirm this is working, we need to ensure that:

- Traffic from other accounts isn’t disrupted.
- Event postbacks for this app(s) aren’t disrupted.
- If an IDLink is present, it is included in the install postback.
- If no IDLink is present, the install postback is not sent.

### 2. CAP Auto-Provision Features

Next, we will test the CAP auto-provision features. For this, we need to coordinate with Skillz to have them send events for an app not currently in our system, to trigger our auto-provision logic. To confirm this is functioning correctly, we need to verify that:

- App creation proceeds without disruption, regardless of successful CAP creation.
- A CAP is created for this auto-provisioned app, including:
  - The correct template ID.
  - Appropriate triggers set up.
- No race condition occurs between app creation and CAP creation.
- No delays occur for events or installs from this app.

### 3. Backfill Script Verification

Finally, we will verify that our backfill script successfully creates triggers for all existing Skillz apps. To confirm this, we will:

- Query for the count of Skillz apps using CAPS before and after running the script.