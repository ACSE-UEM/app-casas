# 6. Compliance, Security, and Risks

As a platform dealing with personal data of volunteers, institutional data of NGOs, and serving the general public, strict compliance is mandatory.

## 6.1. Data Privacy and LGPD (General Data Protection Law)
The system must be engineered with **Privacy by Default**.

### Mandatory Features (LGPD Checklist):
- [ ] **Data Deletion Request:** Users and Casas must be able to request total deletion of their data.
- [ ] **Data Correction Request:** Mechanism to request correction of inaccurate data.
- [ ] **Report Third-Party Data:** Mechanism for legitimate representatives to report/claim a Casa profile created by a third party.
- [ ] **Data Export (Portability):** Produce structured JSON exports of user/Casa data.
- [ ] **Anonymized Feedback:** Ensure feedback mechanisms (Obtenção de Feedback) strip PII (Personally Identifiable Information) before analytical storage.
- [ ] **Consent Logging:** Explicit tracking of consent for users signing up as volunteers (Quero Ajudar).

## 6.2. Accessibility (WCAG Compliance)
The platform must serve all demographics, including elderly users and people with disabilities.
- [ ] **VLibras Integration:** Support for Brazilian Sign Language translation.
- [ ] **High Contrast Mode:** UI toggles for visually impaired users.
- [ ] **Semantic HTML:** Strict adherence to screen-reader-friendly HTML tags.

## 6.3. Institutional Risks & Mitigations

| Risk | Impact | Mitigation Strategy |
| :--- | :--- | :--- |
| **Spam / Unverified Houses** | High (Damages trust) | Public registry requires manual review by Regional Reviewers. Unverified houses are isolated, marked clearly, and hidden from SEO indexing. |
| **Doctrinal Misalignment** | High (Loss of institutional support) | Strict taxonomy mapped to FEB (National Spiritist Federation) standards. Custom activities flagged. |
| **Low Adoption Rate** | Medium | Implement simple registration (phone-only). Push "Answer Engine Optimization" to show immediate value via Google search results. |
| **Data Leakage (Volunteers)**| High (Legal/LGPD) | Role-Based Access Control (RBAC). Only authorized coordinators can view volunteer lists. |

## 6.4. Decision Making Criteria for New Features
Before approving a new feature from the backlog, it must pass these criteria:
1. Does it serve the mission of the Spiritist Doctrine?
2. Does it align with the Brazilian Spiritist Movement Work Plan (PTMEB)?
3. Is it legally and technically safe?
4. Does it simplify the life of the user rather than creating pressure?
