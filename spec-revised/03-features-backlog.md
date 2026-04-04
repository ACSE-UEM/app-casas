# 3. Features Backlog

This backlog is organized into Epics. Descriptions have been refactored for clarity, focusing on value delivery and compliance.

## Epic 1: Onboarding and Adhesion
**Goal:** Reduce friction for new Casas to join the platform while maintaining data integrity and security against spam.
*   **Feat 1.1: Simplified Registration:** As a House Admin, I want to register using a phone number instead of an email, so that less tech-savvy users can easily join.
*   **Feat 1.2: Webhook & Automation Trigger:** As a System Admin, when a Casa registers, I want webhooks to fire so that regional mapping (macro/micro/municipio) happens automatically.
*   **Feat 1.3: Reviewer Notifications:** As a Regional Reviewer, I want to be notified immediately (via email/SMS/WhatsApp/WebSocket) when a new Casa registers in my jurisdiction.
*   **Feat 1.4: Unverified House Safeguards (Compliance):** As a Security Auditor, I want unverified Casas to have a distinct public status and rate limits to prevent spam/abuse and protect the public.

## Epic 2: Casa Management (Institutional Space)
**Goal:** Provide a comprehensive "intranet" and public showcase for the Center.
*   **Feat 2.1: Basic Data Management:** As a House Admin, I want to manage public contacts, departments, and basic info.
*   **Feat 2.2: Theme & Branding Customization:** As a House Admin, I want to select visual themes and upload logos/assets for my Casa's page.
*   **Feat 2.3: Support & Administrative Guides:** As a House Admin, I want the system to render specific administrative guides (legal, doctrinal) dynamically based on the activities my Casa offers.
*   **Feat 2.4: Feature Toggles:** As a House Admin, I want to toggle specific modules (Events, Lectures, Volunteer recruitment) on/off for my Casa.

## Epic 3: Activities, Events, and Lectures Management
**Goal:** Map the core work of the center and make it discoverable.
*   **Feat 3.1: Activity CRUD:** As a Coordinator, I want to create deep profiles for activities (slug, schedule, format, responsibility, exportable ICS calendar).
*   **Feat 3.2: Volunteer Recruitment (Quero Ajudar):** As a Coordinator, I want to flag an activity as "Accepting Volunteers" so that interested individuals can apply directly.
*   **Feat 3.3: Event Management:** As a Coordinator, I want to create time-bound events with registration URLs and social sharing buttons.
*   **Feat 3.4: Lecture Management & Promotion:** As a Coordinator, I want to register public lectures so they appear automatically on the State/Regional marquee headers and Casa homepage.
*   **Feat 3.5: AI Art Generation (Events):** As a Coordinator, I want the system to suggest AI-generated promotional art based on the event's data.

## Epic 4: Search and Discovery (Public Facing)
**Goal:** Allow the public to find help, lectures, and Casas easily.
*   **Feat 4.1: Advanced Filtering:** As a User, I want to search Casas by proximity, specific task, local, or "open right now".
*   **Feat 4.2: Map View:** As a User, I want to view "What's happening now" on an interactive map.
*   **Feat 4.3: Fraternal Assistance Routing (SOS):** As a User in distress, I want to find the nearest Fraternal Assistance or be immediately routed to 24/7 online services (CVV, FEB Escuta) if none are open locally.
*   **Feat 4.4: Natural Language Search (MCP):** As a User, I want to use AI/Natural Language to ask questions like "Where is there a youth evangelization meeting near me on Saturdays?".

## Epic 5: Federated & Regional Management
**Goal:** Empower Regional organs to manage their jurisdictions.
*   **Feat 5.1: Regional Spaces (Macro/Micro/Municipal):** As a Regional Rep, I want a dedicated page for my organ with contacts, social networks, and a consolidated view of all Casas under my jurisdiction.
*   **Feat 5.2: Regional Demographics & Studies:** As a Regional Rep, I want to extract demographic data (Censo) to plan regional projects.
*   **Feat 5.3: House Demands/Requests:** As a Regional Rep, I want to view a widget of "Solicitações" (Requests for help/support) submitted by Casas in my region.

## Epic 6: Governance and Feedback
**Goal:** Maintain data accuracy and community engagement.
*   **Feat 6.1: Report Data Issues:** As a User, I want to report incorrect data on a Casa's profile.
*   **Feat 6.2: Feature Voting:** As a House Admin, I want to suggest ideas and vote on the platform's upcoming features.
