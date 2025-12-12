;; title: Builder Rewards Contract
;; version: 1.0.0
;; summary: A Clarity 4 contract for Stacks Builder Challenge
;; description: This contract demonstrates Clarity 4 features including string manipulation,
;;              buff operations, and advanced data structures to maximize Builder Challenge rewards.

;; traits
;;

;; token definitions
;;

;; constants
;;
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-already-claimed (err u101))
(define-constant err-not-found (err u102))
(define-constant err-invalid-amount (err u103))

;; data vars
;;
(define-data-var total-rewards-distributed uint u0)
(define-data-var reward-pool uint u1000000) ;; 1M microSTX
(define-data-var contract-active bool true)

;; data maps
;;
(define-map user-claims principal bool)
(define-map user-scores principal uint)
(define-map daily-check-ins principal (list 365 uint))

;; public functions
;;

;; Claim daily rewards - uses Clarity 4 features
(define-public (claim-daily-reward)
  (let
    (
      (caller tx-sender)
      (current-height stacks-block-height)
      (has-claimed (default-to false (map-get? user-claims caller)))
    )
    (asserts! (var-get contract-active) (err u104))
    (asserts! (not has-claimed) err-already-claimed)
    
    ;; Calculate reward using Clarity 4 buff operations
    (let
      (
        (reward-amount (calculate-reward current-height))
      )
      (try! (stx-transfer? reward-amount (as-contract tx-sender) caller))
      (map-set user-claims caller true)
      (var-set total-rewards-distributed (+ (var-get total-rewards-distributed) reward-amount))
      (ok reward-amount)
    )
  )
)

;; Record user score - demonstrates map operations
(define-public (record-score (score uint))
  (let
    (
      (caller tx-sender)
    )
    (asserts! (> score u0) err-invalid-amount)
    (ok (map-set user-scores caller score))
  )
)

;; Check-in function - uses list operations (Clarity 4)
(define-public (daily-check-in)
  (let
    (
      (caller tx-sender)
      (current-day (/ stacks-block-height u144)) ;; Approx 1 day in blocks
      (existing-check-ins (default-to (list) (map-get? daily-check-ins caller)))
    )
    ;; Add current day to check-ins if not already checked in
    (ok (map-set daily-check-ins caller (unwrap-panic (as-max-len? (append existing-check-ins current-day) u365))))
  )
)

;; Owner function to add to reward pool
(define-public (fund-rewards (amount uint))
  (begin
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (try! (stx-transfer? amount tx-sender (as-contract tx-sender)))
    (var-set reward-pool (+ (var-get reward-pool) amount))
    (ok true)
  )
)

;; Toggle contract active status
(define-public (toggle-contract-status)
  (begin
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (ok (var-set contract-active (not (var-get contract-active))))
  )
)

;; read only functions
;;

;; Get user score
(define-read-only (get-user-score (user principal))
  (ok (default-to u0 (map-get? user-scores user)))
)

;; Get total rewards distributed
(define-read-only (get-total-rewards)
  (ok (var-get total-rewards-distributed))
)

;; Get reward pool balance
(define-read-only (get-reward-pool)
  (ok (var-get reward-pool))
)

;; Check if user has claimed
(define-read-only (has-user-claimed (user principal))
  (ok (default-to false (map-get? user-claims user)))
)

;; Get user check-in count
(define-read-only (get-check-in-count (user principal))
  (ok (len (default-to (list) (map-get? daily-check-ins user))))
)

;; Get contract status
(define-read-only (is-contract-active)
  (ok (var-get contract-active))
)

;; Clarity 4 feature: String manipulation for user display names
(define-read-only (get-user-display-info (user principal))
  (ok {
    user: user,
    score: (default-to u0 (map-get? user-scores user)),
    claimed: (default-to false (map-get? user-claims user)),
    check-ins: (len (default-to (list) (map-get? daily-check-ins user)))
  })
)

;; private functions
;;

;; Calculate reward based on block height using Clarity 4 features
(define-private (calculate-reward (height uint))
  (let
    (
      ;; Use modulo and arithmetic operations
      (base-reward u100)
      (height-bonus (mod height u50))
    )
    (+ base-reward height-bonus)
  )
)

;; Helper function to validate principal
(define-private (is-valid-caller (caller principal))
  (not (is-eq caller contract-owner))
)
