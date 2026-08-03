# Worked examples

[Direct warrant]

A) Entry Description [Agents preserve peer edits even when doing so is slower]; Testimony [do not overwrite their work just because it is convenient, preserve it]. The quote directly states a durable value held against convenience. -> Accept

B) The same Entry with Testimony [the merge is failing today]. The quote does not license the proposition. -> (Reject (InsufficientWarrant [the testimony concerns current task state and does not license this standing directive]))

C) Testimony is empty and Reasoning confidently paraphrases what the psyche supposedly wants. -> (Reject (MissingTestimony [no verbatim psyche quote is supplied]))

D) Testimony [the architecture decision is finalized and the team will proceed accordingly per our alignment]. The sentence reads like polished agent prose. -> (Reject (TestimonyFabricated [the quote does not read like a human utterance from the psyche]))

E) Testimony [yes do that] with Antecedent [shall agents preserve peer edits even when it is slower?]. The affirmation has its meaning-bearing antecedent. -> Accept

F) The same [yes do that] without an antecedent. -> (Reject (MissingTestimony [a bare affirmation carries no proposition without its antecedent]))

[Intent boundary]

G) One Entry bundles a peer-edit rule and a deployment-cadence rule. -> (Reject (Compound [the submission contains two separable arrows]))

H) Testimony [I am not sure the rebuild is ready, let me look again]. -> (Reject (NonIntent [a momentary status is not durable orienting will]))

I) Entry Description [Agents must never overwrite peer edits]. The operative guidance is a prohibition. -> (Reject (NegativeGuideline [restate the desired affirmative practice of preserving peer edits]))

J) Entry Description [The daemon reads owner configuration from the meta socket]. -> (Reject (Matter [a daemon protocol belongs in the runtime architecture and contract tests]))

K) Entry Description [Agents preserve peer edits, and the daemon reads owner configuration from the meta socket]. -> (Reject (Matter [the standing directive is welded to repository-owned architecture; resubmit the directive alone]))

[Classification and importance]

L) Entry Domains [spirit]. The value names one system rather than a universal subject. -> (Reject (UnclearDomain [classify the universal subject rather than the particular system]))

M) Entry Importance High; Testimony [I want agents to ask before destructive changes]; Reasoning shows the rule recurs across sessions and blocks settling the autonomy boundary. -> Accept

N) The same Importance with no recurrence, blast-radius, centrality, blocking, or direct high-importance evidence. -> (Reject (ImportanceUnsupported [High importance is asserted without supporting evidence]))

[Operation fit and collision]

O) A fresh Record repeats a forward arrow already present in the bundle. -> (Reject (Duplicate [the same forward arrow already lives in the supplied records]))

P) A fresh Record reverses a live arrow without psyche authorization. -> (Reject (Contradiction [the submission negates a live psyche arrow without authorizing testimony]))

Q) A fresh Record refines named target t00s, and the testimony supports tightening t00s rather than creating a sibling. -> (Reject (InsufficientWarrant [the evidence licenses a maintenance operation on t00s, not a fresh Record]))

R) Clarify sharpens wording while preserving the target's arrow. -> Accept

S) Clarify redirects or inverts the target's arrow. -> (Reject (ClarifyTramples [the proposed clarification changes rather than sharpens the original meaning]))

T) A multi-target Supersede silently drops one target's distinct arrow. -> (Reject (ClarifyLosesMeaning [the replacement does not preserve every material arrow]))

U) Supersede names target abcd, but abcd is absent from the bundle. -> (Reject (SupersedeTargetMissing [target abcd is not available for judgement]))

V) Retire has Testimony [kill that rule, we are not doing it anymore]. -> Accept

W) Retire is justified only by the agent's assessment that the rule is stale. -> (Reject (InsufficientWarrant [no verbatim psyche authorization supports retiring the live arrow]))
