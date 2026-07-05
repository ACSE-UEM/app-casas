# Design System Strategy: The Ethereal Professional

## 1. Overview & Creative North Star
**Creative North Star: "The Digital Sanctuary"**

This design system moves beyond the cold, utilitarian nature of traditional spiritual or corporate apps. It is an editorial-inspired "Digital Sanctuary" that balances professional reliability with a profound sense of serenity. We achieve this by rejecting the "boxed-in" feeling of standard UI. Instead of rigid grids and harsh borders, we utilize **Asymmetric White Space** and **Atmospheric Layering**.

The layout should feel like an open, sunlit room. Elements don't just "sit" on the screen; they float within a cohesive environment of light and soft color transitions. By using wide margins and intentional overlaps, we guide the user’s eye with a gentle hand, replacing the frantic energy of standard digital interfaces with a rhythmic, calming pace.

---

## 2. Colors: Tonal Atmosphere
We do not use color merely for decoration; we use it to define the "weight" of the experience.

*   **Primary (`#32617d`):** A deep, trustworthy blue used sparingly for high-intent actions.
*   **Secondary (`#2d685f`):** The "Verde Água" (Teal) presence, providing a bridge between the spiritual and the professional.
*   **Tertiary (`#735c00`):** The "Pale Gold" accent. Use this for moments of enlightenment or success states (icons, delicate accents).

### The Core Directives
*   **The "No-Line" Rule:** 1px solid borders are strictly prohibited for sectioning. Differentiation must be achieved through background shifts. For example, a `surface-container-low` component should sit directly on a `surface` background. The change in tone is the boundary.
*   **Surface Hierarchy & Nesting:** Think of the UI as layers of fine parchment. Use `surface-container-lowest` (#ffffff) for the most interactive, "closest" elements to the user, and `surface-dim` (#d8dadd) for background utility areas.
*   **Signature Textures:** For Hero sections or large CTAs, use a linear gradient: `primary` (#32617d) to `primary-container` (#4c7a97) at a 135-degree angle. This provides a "soulful" depth that flat hex codes lack.

---

## 3. Typography: Editorial Authority
We pair **Manrope** (Display/Headlines) with **Public Sans** (Body/Labels) to create a balance of modern character and timeless legibility.

| Level | Token | Font | Size | Character |
| :--- | :--- | :--- | :--- | :--- |
| **Display** | `display-lg` | Manrope | 3.5rem | High-impact, poetic statements. |
| **Headline** | `headline-md`| Manrope | 1.75rem | Clear, welcoming section headers. |
| **Title** | `title-lg` | Public Sans | 1.375rem | Professional and structured info. |
| **Body** | `body-lg` | Public Sans | 1.0rem | The standard for contemplative reading. |
| **Label** | `label-md` | Public Sans | 0.75rem | Tertiary metadata and captions. |

**Editorial Note:** Use `display-lg` with a slightly tighter letter-spacing (-0.02em) and `body-lg` with generous line-height (1.6) to ensure the text "breathes" and feels like a premium publication.

---

## 4. Elevation & Depth: The Tonal Layering Principle
Shadows are a secondary thought; layering is the primary language.

*   **Tonal Stacking:** To create a card, do not use a border. Place a `surface-container-lowest` card on a `surface-container-low` background. The subtle 2-3% shift in lightness is sufficient for the human eye to perceive depth without adding visual noise.
*   **Ambient Shadows:** For floating elements (like FABs or Modals), use a custom shadow: `0px 12px 32px rgba(25, 28, 30, 0.06)`. The shadow color is a tinted version of `on-surface`, making it feel like a natural light obstruction rather than a gray smudge.
*   **The "Glass" Component:** Use Glassmorphism for navigation bars. Apply a `surface` color with 80% opacity and a `20px` backdrop-blur. This keeps the user grounded in their current context as content flows underneath.
*   **The Ghost Border Fallback:** If a divider is essential for accessibility, use the `outline-variant` token at **15% opacity**. It should be a whisper, not a statement.

---

## 5. Components: Soft & Purposeful

### Buttons (The Core Interaction)
*   **Primary:** Background: `primary` gradient; Label: `on-primary` (All-caps for authority, 0.5px tracking). Radius: `xl` (1.5rem).
*   **Secondary:** Background: `secondary-container`; Label: `on-secondary-container`. No border.
*   **Tertiary:** No background. `primary` text. Used for "Cancel" or "Read More."

### Cards (Content Vessels)
*   **Rule:** Zero borders. Vertical white space (using a 24px/32px/48px scale) must replace divider lines.
*   **Shape:** Use `xl` (1.5rem) corner radius to evoke a soft, welcoming feel.
*   **Content:** Group related info using the `surface-container` tiers to create internal nesting without adding lines.

### Maps & Departments
*   **Integrated Maps:** Use a custom map style that desaturates greens and emphasizes blues, matching our `surface` and `secondary` tokens.
*   **Department Icons:** Soft, organic shapes (circles or "squircular" blobs) using `secondary-fixed` as the background for the icon container.

### Inputs & Selection
*   **Fields:** Background-filled (`surface-container-highest`) rather than outlined. This makes the form feel "grounded" and less intimidating.
*   **Checkboxes/Radios:** Use `primary` for the active state. The roundedness of the checkbox should match `sm` (0.25rem) to maintain the system's softness.

---

## 6. Do’s and Don’ts

### Do
*   **Do** use asymmetrical layouts. Let an image overlap a container or a headline bleed into the margin. It feels "custom" and human.
*   **Do** prioritize `surface-container-lowest` for cards containing high-value interactive data.
*   **Do** ensure all text on `primary` or `secondary` backgrounds passes WCAG AA contrast ratios (native alto contraste).

### Don't
*   **Don't** use black (#000000). Use `on-surface` (#191c1e) for a softer, more professional depth.
*   **Don't** use 1px dividers between list items. Use 16px of `surface-container-low` padding instead.
*   **Don't** use sharp corners. Every interaction point should have at least a `md` (0.75rem) radius to maintain the "serene" promise.
*   **Don't** clutter. If a screen feels busy, increase the white space by 20% before removing content. Let the system breathe.