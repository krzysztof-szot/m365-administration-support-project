# M365-012 — Document access remains after one sharing link is revoked

Status: **RESOLVED**\
Type: **Guided synthetic access-diagnosis exercise / Stage 08**\
Execution date: **16 November 2026**

## Trigger and expected behavior

Remove one controlled sharing link to KB-01 and determine whether Piotr still has another authorized access path. This is not a production permission outage or a request to remove Piotr from the knowledge site.

## Starting state

Capture 02 shows Piotr with Read on BFL-M365-Knowledge. The owner confirms a Specific people / People you choose link addressed to Piotr with Can view. Capture 05 shows Piotr opening the checklist in Viewing, not the link-settings dialog; link configuration is owner-reported.

## Action and observed result

1. Removed the selected test link, owner-confirmed.
2. The previously saved URL returned **"This link has been removed."**, explicitly reported by the owner.
3. Piotr still opened KB-01 through the site and Knowledge library, owner-confirmed.

The old link is invalid. Continued document access does not mean revocation failed: another authorized path remains, consistent with Piotr's retained site/group Read baseline. A complete post-sharing KB-01 ACL or inheritance flag was not captured. Sharing may copy parent group entries into an item's unique scope; deleting a link is not recorded as restoring inheritance or removing every such grant.

## Independent boundary control

On the fresh LAB-D08-Restricted folder, capture 07 shows inherited Knowledge groups. The owner confirms expected Check Permissions changes when the Visitors folder grant was removed after breaking inheritance. Piotr was denied the TXT in 06 while Marek still opened it and Piotr still opened main KB-01. Restoring folder inheritance restored Piotr's TXT access, owner-confirmed. No literal effective-access dialog output is invented.

## Resolution and retained state

Closed as **diagnosed expected retained access**: the selected link is removed and Piotr's intended knowledge-site Read remains. The test folder is restored. This does not claim complete Piotr access revocation or a permanent restricted folder. Exact propagation times and a full raw item-permission audit were not measured.

## Suggested closure wording

"The selected link has been removed and its URL no longer works. Piotr still has authorized document access through the knowledge site's retained permission model. Removing a link and removing all access are different actions; the separate folder test verified denial and restoration without changing the site role."

This is sample wording, not an externally sent message.

[Stage](../docs/stages/08-sharepoint-and-sharing.md) · [Results](../tests/day-08.md) · [Evidence](../evidence/day-08/README.md) · [Access matrix](../docs/access-matrix.md)
