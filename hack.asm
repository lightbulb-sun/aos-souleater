.gba
.open "hack.gba", 0x08000000

FREE_SPACE                          equ 0x08160100
CUR_WEAPON                          equ 0x02013268
WEAPON_DEATHS_SICKLE                equ 0x27
SOULEATERRING_APPEARANCE_INCREASE   equ 8

.thumb

.org 0x080684be
        bl      souleaterring_check

.org FREE_SPACE
souleaterring_check:
        push    {lr}
@@check_for_deaths_sickle:
        ldr     r1, =CUR_WEAPON
        ldrb    r1, [r1]
        cmp     r1, WEAPON_DEATHS_SICKLE
        bne     @@continue_with_soul_eater_ring
@@have_deaths_sickle:
        add     r5, SOULEATERRING_APPEARANCE_INCREASE
@@continue_with_soul_eater_ring:
        ; replace original instruction
        bl      0x0804b314
        pop     {pc}

.pool

.close
