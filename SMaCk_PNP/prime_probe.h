
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/mman.h>


#define SET_ASSOC 8
#define PAGE_SIZE 4096

typedef struct sample_block_t{
    uint64_t lines[SET_ASSOC];
}sample_block;


typedef void (* type_smc_prime_l1i)();
type_smc_prime_l1i prime_set_func[64];

typedef void (* type_smc_probe_l1i)(sample_block *);
type_smc_probe_l1i probe_set_func[64];

extern void smc_prime_l1i_set0();
extern void smc_probe_l1i_set0(sample_block * samples);
extern void smc_target_set0_0();
extern void smc_target_set0_1();
extern void smc_target_set0_2();
extern void smc_target_set0_3();
extern void smc_target_set0_4();
extern void smc_target_set0_5();
extern void smc_target_set0_6();
extern void smc_target_set0_7();

extern void smc_prime_l1i_set1();
extern void smc_probe_l1i_set1(sample_block * samples);
extern void smc_target_set1_0();
extern void smc_target_set1_1();
extern void smc_target_set1_2();
extern void smc_target_set1_3();
extern void smc_target_set1_4();
extern void smc_target_set1_5();
extern void smc_target_set1_6();
extern void smc_target_set1_7();

extern void smc_prime_l1i_set2();
extern void smc_probe_l1i_set2(sample_block * samples);
extern void smc_target_set2_0();
extern void smc_target_set2_1();
extern void smc_target_set2_2();
extern void smc_target_set2_3();
extern void smc_target_set2_4();
extern void smc_target_set2_5();
extern void smc_target_set2_6();
extern void smc_target_set2_7();

extern void smc_prime_l1i_set3();
extern void smc_probe_l1i_set3(sample_block * samples);
extern void smc_target_set3_0();
extern void smc_target_set3_1();
extern void smc_target_set3_2();
extern void smc_target_set3_3();
extern void smc_target_set3_4();
extern void smc_target_set3_5();
extern void smc_target_set3_6();
extern void smc_target_set3_7();

extern void smc_prime_l1i_set4();
extern void smc_probe_l1i_set4(sample_block * samples);
extern void smc_target_set4_0();
extern void smc_target_set4_1();
extern void smc_target_set4_2();
extern void smc_target_set4_3();
extern void smc_target_set4_4();
extern void smc_target_set4_5();
extern void smc_target_set4_6();
extern void smc_target_set4_7();

extern void smc_prime_l1i_set5();
extern void smc_probe_l1i_set5(sample_block * samples);
extern void smc_target_set5_0();
extern void smc_target_set5_1();
extern void smc_target_set5_2();
extern void smc_target_set5_3();
extern void smc_target_set5_4();
extern void smc_target_set5_5();
extern void smc_target_set5_6();
extern void smc_target_set5_7();

extern void smc_prime_l1i_set6();
extern void smc_probe_l1i_set6(sample_block * samples);
extern void smc_target_set6_0();
extern void smc_target_set6_1();
extern void smc_target_set6_2();
extern void smc_target_set6_3();
extern void smc_target_set6_4();
extern void smc_target_set6_5();
extern void smc_target_set6_6();
extern void smc_target_set6_7();

extern void smc_prime_l1i_set7();
extern void smc_probe_l1i_set7(sample_block * samples);
extern void smc_target_set7_0();
extern void smc_target_set7_1();
extern void smc_target_set7_2();
extern void smc_target_set7_3();
extern void smc_target_set7_4();
extern void smc_target_set7_5();
extern void smc_target_set7_6();
extern void smc_target_set7_7();

extern void smc_prime_l1i_set8();
extern void smc_probe_l1i_set8(sample_block * samples);
extern void smc_target_set8_0();
extern void smc_target_set8_1();
extern void smc_target_set8_2();
extern void smc_target_set8_3();
extern void smc_target_set8_4();
extern void smc_target_set8_5();
extern void smc_target_set8_6();
extern void smc_target_set8_7();

extern void smc_prime_l1i_set9();
extern void smc_probe_l1i_set9(sample_block * samples);
extern void smc_target_set9_0();
extern void smc_target_set9_1();
extern void smc_target_set9_2();
extern void smc_target_set9_3();
extern void smc_target_set9_4();
extern void smc_target_set9_5();
extern void smc_target_set9_6();
extern void smc_target_set9_7();

extern void smc_prime_l1i_set10();
extern void smc_probe_l1i_set10(sample_block * samples);
extern void smc_target_set10_0();
extern void smc_target_set10_1();
extern void smc_target_set10_2();
extern void smc_target_set10_3();
extern void smc_target_set10_4();
extern void smc_target_set10_5();
extern void smc_target_set10_6();
extern void smc_target_set10_7();

extern void smc_prime_l1i_set11();
extern void smc_probe_l1i_set11(sample_block * samples);
extern void smc_target_set11_0();
extern void smc_target_set11_1();
extern void smc_target_set11_2();
extern void smc_target_set11_3();
extern void smc_target_set11_4();
extern void smc_target_set11_5();
extern void smc_target_set11_6();
extern void smc_target_set11_7();

extern void smc_prime_l1i_set12();
extern void smc_probe_l1i_set12(sample_block * samples);
extern void smc_target_set12_0();
extern void smc_target_set12_1();
extern void smc_target_set12_2();
extern void smc_target_set12_3();
extern void smc_target_set12_4();
extern void smc_target_set12_5();
extern void smc_target_set12_6();
extern void smc_target_set12_7();

extern void smc_prime_l1i_set13();
extern void smc_probe_l1i_set13(sample_block * samples);
extern void smc_target_set13_0();
extern void smc_target_set13_1();
extern void smc_target_set13_2();
extern void smc_target_set13_3();
extern void smc_target_set13_4();
extern void smc_target_set13_5();
extern void smc_target_set13_6();
extern void smc_target_set13_7();

extern void smc_prime_l1i_set14();
extern void smc_probe_l1i_set14(sample_block * samples);
extern void smc_target_set14_0();
extern void smc_target_set14_1();
extern void smc_target_set14_2();
extern void smc_target_set14_3();
extern void smc_target_set14_4();
extern void smc_target_set14_5();
extern void smc_target_set14_6();
extern void smc_target_set14_7();

extern void smc_prime_l1i_set15();
extern void smc_probe_l1i_set15(sample_block * samples);
extern void smc_target_set15_0();
extern void smc_target_set15_1();
extern void smc_target_set15_2();
extern void smc_target_set15_3();
extern void smc_target_set15_4();
extern void smc_target_set15_5();
extern void smc_target_set15_6();
extern void smc_target_set15_7();

extern void smc_prime_l1i_set16();
extern void smc_probe_l1i_set16(sample_block * samples);
extern void smc_target_set16_0();
extern void smc_target_set16_1();
extern void smc_target_set16_2();
extern void smc_target_set16_3();
extern void smc_target_set16_4();
extern void smc_target_set16_5();
extern void smc_target_set16_6();
extern void smc_target_set16_7();

extern void smc_prime_l1i_set17();
extern void smc_probe_l1i_set17(sample_block * samples);
extern void smc_target_set17_0();
extern void smc_target_set17_1();
extern void smc_target_set17_2();
extern void smc_target_set17_3();
extern void smc_target_set17_4();
extern void smc_target_set17_5();
extern void smc_target_set17_6();
extern void smc_target_set17_7();

extern void smc_prime_l1i_set18();
extern void smc_probe_l1i_set18(sample_block * samples);
extern void smc_target_set18_0();
extern void smc_target_set18_1();
extern void smc_target_set18_2();
extern void smc_target_set18_3();
extern void smc_target_set18_4();
extern void smc_target_set18_5();
extern void smc_target_set18_6();
extern void smc_target_set18_7();

extern void smc_prime_l1i_set19();
extern void smc_probe_l1i_set19(sample_block * samples);
extern void smc_target_set19_0();
extern void smc_target_set19_1();
extern void smc_target_set19_2();
extern void smc_target_set19_3();
extern void smc_target_set19_4();
extern void smc_target_set19_5();
extern void smc_target_set19_6();
extern void smc_target_set19_7();

extern void smc_prime_l1i_set20();
extern void smc_probe_l1i_set20(sample_block * samples);
extern void smc_target_set20_0();
extern void smc_target_set20_1();
extern void smc_target_set20_2();
extern void smc_target_set20_3();
extern void smc_target_set20_4();
extern void smc_target_set20_5();
extern void smc_target_set20_6();
extern void smc_target_set20_7();

extern void smc_prime_l1i_set21();
extern void smc_probe_l1i_set21(sample_block * samples);
extern void smc_target_set21_0();
extern void smc_target_set21_1();
extern void smc_target_set21_2();
extern void smc_target_set21_3();
extern void smc_target_set21_4();
extern void smc_target_set21_5();
extern void smc_target_set21_6();
extern void smc_target_set21_7();

extern void smc_prime_l1i_set22();
extern void smc_probe_l1i_set22(sample_block * samples);
extern void smc_target_set22_0();
extern void smc_target_set22_1();
extern void smc_target_set22_2();
extern void smc_target_set22_3();
extern void smc_target_set22_4();
extern void smc_target_set22_5();
extern void smc_target_set22_6();
extern void smc_target_set22_7();

extern void smc_prime_l1i_set23();
extern void smc_probe_l1i_set23(sample_block * samples);
extern void smc_target_set23_0();
extern void smc_target_set23_1();
extern void smc_target_set23_2();
extern void smc_target_set23_3();
extern void smc_target_set23_4();
extern void smc_target_set23_5();
extern void smc_target_set23_6();
extern void smc_target_set23_7();

extern void smc_prime_l1i_set24();
extern void smc_probe_l1i_set24(sample_block * samples);
extern void smc_target_set24_0();
extern void smc_target_set24_1();
extern void smc_target_set24_2();
extern void smc_target_set24_3();
extern void smc_target_set24_4();
extern void smc_target_set24_5();
extern void smc_target_set24_6();
extern void smc_target_set24_7();

extern void smc_prime_l1i_set25();
extern void smc_probe_l1i_set25(sample_block * samples);
extern void smc_target_set25_0();
extern void smc_target_set25_1();
extern void smc_target_set25_2();
extern void smc_target_set25_3();
extern void smc_target_set25_4();
extern void smc_target_set25_5();
extern void smc_target_set25_6();
extern void smc_target_set25_7();

extern void smc_prime_l1i_set26();
extern void smc_probe_l1i_set26(sample_block * samples);
extern void smc_target_set26_0();
extern void smc_target_set26_1();
extern void smc_target_set26_2();
extern void smc_target_set26_3();
extern void smc_target_set26_4();
extern void smc_target_set26_5();
extern void smc_target_set26_6();
extern void smc_target_set26_7();

extern void smc_prime_l1i_set27();
extern void smc_probe_l1i_set27(sample_block * samples);
extern void smc_target_set27_0();
extern void smc_target_set27_1();
extern void smc_target_set27_2();
extern void smc_target_set27_3();
extern void smc_target_set27_4();
extern void smc_target_set27_5();
extern void smc_target_set27_6();
extern void smc_target_set27_7();

extern void smc_prime_l1i_set28();
extern void smc_probe_l1i_set28(sample_block * samples);
extern void smc_target_set28_0();
extern void smc_target_set28_1();
extern void smc_target_set28_2();
extern void smc_target_set28_3();
extern void smc_target_set28_4();
extern void smc_target_set28_5();
extern void smc_target_set28_6();
extern void smc_target_set28_7();

extern void smc_prime_l1i_set29();
extern void smc_probe_l1i_set29(sample_block * samples);
extern void smc_target_set29_0();
extern void smc_target_set29_1();
extern void smc_target_set29_2();
extern void smc_target_set29_3();
extern void smc_target_set29_4();
extern void smc_target_set29_5();
extern void smc_target_set29_6();
extern void smc_target_set29_7();

extern void smc_prime_l1i_set30();
extern void smc_probe_l1i_set30(sample_block * samples);
extern void smc_target_set30_0();
extern void smc_target_set30_1();
extern void smc_target_set30_2();
extern void smc_target_set30_3();
extern void smc_target_set30_4();
extern void smc_target_set30_5();
extern void smc_target_set30_6();
extern void smc_target_set30_7();

extern void smc_prime_l1i_set31();
extern void smc_probe_l1i_set31(sample_block * samples);
extern void smc_target_set31_0();
extern void smc_target_set31_1();
extern void smc_target_set31_2();
extern void smc_target_set31_3();
extern void smc_target_set31_4();
extern void smc_target_set31_5();
extern void smc_target_set31_6();
extern void smc_target_set31_7();

extern void smc_prime_l1i_set32();
extern void smc_probe_l1i_set32(sample_block * samples);
extern void smc_target_set32_0();
extern void smc_target_set32_1();
extern void smc_target_set32_2();
extern void smc_target_set32_3();
extern void smc_target_set32_4();
extern void smc_target_set32_5();
extern void smc_target_set32_6();
extern void smc_target_set32_7();

extern void smc_prime_l1i_set33();
extern void smc_probe_l1i_set33(sample_block * samples);
extern void smc_target_set33_0();
extern void smc_target_set33_1();
extern void smc_target_set33_2();
extern void smc_target_set33_3();
extern void smc_target_set33_4();
extern void smc_target_set33_5();
extern void smc_target_set33_6();
extern void smc_target_set33_7();

extern void smc_prime_l1i_set34();
extern void smc_probe_l1i_set34(sample_block * samples);
extern void smc_target_set34_0();
extern void smc_target_set34_1();
extern void smc_target_set34_2();
extern void smc_target_set34_3();
extern void smc_target_set34_4();
extern void smc_target_set34_5();
extern void smc_target_set34_6();
extern void smc_target_set34_7();

extern void smc_prime_l1i_set35();
extern void smc_probe_l1i_set35(sample_block * samples);
extern void smc_target_set35_0();
extern void smc_target_set35_1();
extern void smc_target_set35_2();
extern void smc_target_set35_3();
extern void smc_target_set35_4();
extern void smc_target_set35_5();
extern void smc_target_set35_6();
extern void smc_target_set35_7();

extern void smc_prime_l1i_set36();
extern void smc_probe_l1i_set36(sample_block * samples);
extern void smc_target_set36_0();
extern void smc_target_set36_1();
extern void smc_target_set36_2();
extern void smc_target_set36_3();
extern void smc_target_set36_4();
extern void smc_target_set36_5();
extern void smc_target_set36_6();
extern void smc_target_set36_7();

extern void smc_prime_l1i_set37();
extern void smc_probe_l1i_set37(sample_block * samples);
extern void smc_target_set37_0();
extern void smc_target_set37_1();
extern void smc_target_set37_2();
extern void smc_target_set37_3();
extern void smc_target_set37_4();
extern void smc_target_set37_5();
extern void smc_target_set37_6();
extern void smc_target_set37_7();

extern void smc_prime_l1i_set38();
extern void smc_probe_l1i_set38(sample_block * samples);
extern void smc_target_set38_0();
extern void smc_target_set38_1();
extern void smc_target_set38_2();
extern void smc_target_set38_3();
extern void smc_target_set38_4();
extern void smc_target_set38_5();
extern void smc_target_set38_6();
extern void smc_target_set38_7();

extern void smc_prime_l1i_set39();
extern void smc_probe_l1i_set39(sample_block * samples);
extern void smc_target_set39_0();
extern void smc_target_set39_1();
extern void smc_target_set39_2();
extern void smc_target_set39_3();
extern void smc_target_set39_4();
extern void smc_target_set39_5();
extern void smc_target_set39_6();
extern void smc_target_set39_7();

extern void smc_prime_l1i_set40();
extern void smc_probe_l1i_set40(sample_block * samples);
extern void smc_target_set40_0();
extern void smc_target_set40_1();
extern void smc_target_set40_2();
extern void smc_target_set40_3();
extern void smc_target_set40_4();
extern void smc_target_set40_5();
extern void smc_target_set40_6();
extern void smc_target_set40_7();

extern void smc_prime_l1i_set41();
extern void smc_probe_l1i_set41(sample_block * samples);
extern void smc_target_set41_0();
extern void smc_target_set41_1();
extern void smc_target_set41_2();
extern void smc_target_set41_3();
extern void smc_target_set41_4();
extern void smc_target_set41_5();
extern void smc_target_set41_6();
extern void smc_target_set41_7();

extern void smc_prime_l1i_set42();
extern void smc_probe_l1i_set42(sample_block * samples);
extern void smc_target_set42_0();
extern void smc_target_set42_1();
extern void smc_target_set42_2();
extern void smc_target_set42_3();
extern void smc_target_set42_4();
extern void smc_target_set42_5();
extern void smc_target_set42_6();
extern void smc_target_set42_7();

extern void smc_prime_l1i_set43();
extern void smc_probe_l1i_set43(sample_block * samples);
extern void smc_target_set43_0();
extern void smc_target_set43_1();
extern void smc_target_set43_2();
extern void smc_target_set43_3();
extern void smc_target_set43_4();
extern void smc_target_set43_5();
extern void smc_target_set43_6();
extern void smc_target_set43_7();

extern void smc_prime_l1i_set44();
extern void smc_probe_l1i_set44(sample_block * samples);
extern void smc_target_set44_0();
extern void smc_target_set44_1();
extern void smc_target_set44_2();
extern void smc_target_set44_3();
extern void smc_target_set44_4();
extern void smc_target_set44_5();
extern void smc_target_set44_6();
extern void smc_target_set44_7();

extern void smc_prime_l1i_set45();
extern void smc_probe_l1i_set45(sample_block * samples);
extern void smc_target_set45_0();
extern void smc_target_set45_1();
extern void smc_target_set45_2();
extern void smc_target_set45_3();
extern void smc_target_set45_4();
extern void smc_target_set45_5();
extern void smc_target_set45_6();
extern void smc_target_set45_7();

extern void smc_prime_l1i_set46();
extern void smc_probe_l1i_set46(sample_block * samples);
extern void smc_target_set46_0();
extern void smc_target_set46_1();
extern void smc_target_set46_2();
extern void smc_target_set46_3();
extern void smc_target_set46_4();
extern void smc_target_set46_5();
extern void smc_target_set46_6();
extern void smc_target_set46_7();

extern void smc_prime_l1i_set47();
extern void smc_probe_l1i_set47(sample_block * samples);
extern void smc_target_set47_0();
extern void smc_target_set47_1();
extern void smc_target_set47_2();
extern void smc_target_set47_3();
extern void smc_target_set47_4();
extern void smc_target_set47_5();
extern void smc_target_set47_6();
extern void smc_target_set47_7();

extern void smc_prime_l1i_set48();
extern void smc_probe_l1i_set48(sample_block * samples);
extern void smc_target_set48_0();
extern void smc_target_set48_1();
extern void smc_target_set48_2();
extern void smc_target_set48_3();
extern void smc_target_set48_4();
extern void smc_target_set48_5();
extern void smc_target_set48_6();
extern void smc_target_set48_7();

extern void smc_prime_l1i_set49();
extern void smc_probe_l1i_set49(sample_block * samples);
extern void smc_target_set49_0();
extern void smc_target_set49_1();
extern void smc_target_set49_2();
extern void smc_target_set49_3();
extern void smc_target_set49_4();
extern void smc_target_set49_5();
extern void smc_target_set49_6();
extern void smc_target_set49_7();

extern void smc_prime_l1i_set50();
extern void smc_probe_l1i_set50(sample_block * samples);
extern void smc_target_set50_0();
extern void smc_target_set50_1();
extern void smc_target_set50_2();
extern void smc_target_set50_3();
extern void smc_target_set50_4();
extern void smc_target_set50_5();
extern void smc_target_set50_6();
extern void smc_target_set50_7();

extern void smc_prime_l1i_set51();
extern void smc_probe_l1i_set51(sample_block * samples);
extern void smc_target_set51_0();
extern void smc_target_set51_1();
extern void smc_target_set51_2();
extern void smc_target_set51_3();
extern void smc_target_set51_4();
extern void smc_target_set51_5();
extern void smc_target_set51_6();
extern void smc_target_set51_7();

extern void smc_prime_l1i_set52();
extern void smc_probe_l1i_set52(sample_block * samples);
extern void smc_target_set52_0();
extern void smc_target_set52_1();
extern void smc_target_set52_2();
extern void smc_target_set52_3();
extern void smc_target_set52_4();
extern void smc_target_set52_5();
extern void smc_target_set52_6();
extern void smc_target_set52_7();

extern void smc_prime_l1i_set53();
extern void smc_probe_l1i_set53(sample_block * samples);
extern void smc_target_set53_0();
extern void smc_target_set53_1();
extern void smc_target_set53_2();
extern void smc_target_set53_3();
extern void smc_target_set53_4();
extern void smc_target_set53_5();
extern void smc_target_set53_6();
extern void smc_target_set53_7();

extern void smc_prime_l1i_set54();
extern void smc_probe_l1i_set54(sample_block * samples);
extern void smc_target_set54_0();
extern void smc_target_set54_1();
extern void smc_target_set54_2();
extern void smc_target_set54_3();
extern void smc_target_set54_4();
extern void smc_target_set54_5();
extern void smc_target_set54_6();
extern void smc_target_set54_7();

extern void smc_prime_l1i_set55();
extern void smc_probe_l1i_set55(sample_block * samples);
extern void smc_target_set55_0();
extern void smc_target_set55_1();
extern void smc_target_set55_2();
extern void smc_target_set55_3();
extern void smc_target_set55_4();
extern void smc_target_set55_5();
extern void smc_target_set55_6();
extern void smc_target_set55_7();

extern void smc_prime_l1i_set56();
extern void smc_probe_l1i_set56(sample_block * samples);
extern void smc_target_set56_0();
extern void smc_target_set56_1();
extern void smc_target_set56_2();
extern void smc_target_set56_3();
extern void smc_target_set56_4();
extern void smc_target_set56_5();
extern void smc_target_set56_6();
extern void smc_target_set56_7();

extern void smc_prime_l1i_set57();
extern void smc_probe_l1i_set57(sample_block * samples);
extern void smc_target_set57_0();
extern void smc_target_set57_1();
extern void smc_target_set57_2();
extern void smc_target_set57_3();
extern void smc_target_set57_4();
extern void smc_target_set57_5();
extern void smc_target_set57_6();
extern void smc_target_set57_7();

extern void smc_prime_l1i_set58();
extern void smc_probe_l1i_set58(sample_block * samples);
extern void smc_target_set58_0();
extern void smc_target_set58_1();
extern void smc_target_set58_2();
extern void smc_target_set58_3();
extern void smc_target_set58_4();
extern void smc_target_set58_5();
extern void smc_target_set58_6();
extern void smc_target_set58_7();

extern void smc_prime_l1i_set59();
extern void smc_probe_l1i_set59(sample_block * samples);
extern void smc_target_set59_0();
extern void smc_target_set59_1();
extern void smc_target_set59_2();
extern void smc_target_set59_3();
extern void smc_target_set59_4();
extern void smc_target_set59_5();
extern void smc_target_set59_6();
extern void smc_target_set59_7();

extern void smc_prime_l1i_set60();
extern void smc_probe_l1i_set60(sample_block * samples);
extern void smc_target_set60_0();
extern void smc_target_set60_1();
extern void smc_target_set60_2();
extern void smc_target_set60_3();
extern void smc_target_set60_4();
extern void smc_target_set60_5();
extern void smc_target_set60_6();
extern void smc_target_set60_7();

extern void smc_prime_l1i_set61();
extern void smc_probe_l1i_set61(sample_block * samples);
extern void smc_target_set61_0();
extern void smc_target_set61_1();
extern void smc_target_set61_2();
extern void smc_target_set61_3();
extern void smc_target_set61_4();
extern void smc_target_set61_5();
extern void smc_target_set61_6();
extern void smc_target_set61_7();

extern void smc_prime_l1i_set62();
extern void smc_probe_l1i_set62(sample_block * samples);
extern void smc_target_set62_0();
extern void smc_target_set62_1();
extern void smc_target_set62_2();
extern void smc_target_set62_3();
extern void smc_target_set62_4();
extern void smc_target_set62_5();
extern void smc_target_set62_6();
extern void smc_target_set62_7();

extern void smc_prime_l1i_set63();
extern void smc_probe_l1i_set63(sample_block * samples);
extern void smc_target_set63_0();
extern void smc_target_set63_1();
extern void smc_target_set63_2();
extern void smc_target_set63_3();
extern void smc_target_set63_4();
extern void smc_target_set63_5();
extern void smc_target_set63_6();
extern void smc_target_set63_7();

void prime_probe_mprotect_all(){
mprotect(smc_target_set0_0 - 0, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set0_1 - 0, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set0_2 - 0, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set0_3 - 0, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set0_4 - 0, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set0_5 - 0, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set0_6 - 0, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set0_7 - 0, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[0] = smc_prime_l1i_set0;probe_set_func[0] = smc_probe_l1i_set0;
    
    mprotect(smc_target_set1_0 - 64, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set1_1 - 64, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set1_2 - 64, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set1_3 - 64, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set1_4 - 64, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set1_5 - 64, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set1_6 - 64, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set1_7 - 64, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[1] = smc_prime_l1i_set1;probe_set_func[1] = smc_probe_l1i_set1;
    
    mprotect(smc_target_set2_0 - 128, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set2_1 - 128, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set2_2 - 128, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set2_3 - 128, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set2_4 - 128, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set2_5 - 128, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set2_6 - 128, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set2_7 - 128, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[2] = smc_prime_l1i_set2;probe_set_func[2] = smc_probe_l1i_set2;
    
    mprotect(smc_target_set3_0 - 192, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set3_1 - 192, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set3_2 - 192, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set3_3 - 192, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set3_4 - 192, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set3_5 - 192, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set3_6 - 192, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set3_7 - 192, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[3] = smc_prime_l1i_set3;probe_set_func[3] = smc_probe_l1i_set3;
    
    mprotect(smc_target_set4_0 - 256, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set4_1 - 256, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set4_2 - 256, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set4_3 - 256, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set4_4 - 256, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set4_5 - 256, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set4_6 - 256, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set4_7 - 256, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[4] = smc_prime_l1i_set4;probe_set_func[4] = smc_probe_l1i_set4;
    
    mprotect(smc_target_set5_0 - 320, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set5_1 - 320, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set5_2 - 320, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set5_3 - 320, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set5_4 - 320, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set5_5 - 320, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set5_6 - 320, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set5_7 - 320, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[5] = smc_prime_l1i_set5;probe_set_func[5] = smc_probe_l1i_set5;
    
    mprotect(smc_target_set6_0 - 384, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set6_1 - 384, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set6_2 - 384, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set6_3 - 384, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set6_4 - 384, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set6_5 - 384, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set6_6 - 384, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set6_7 - 384, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[6] = smc_prime_l1i_set6;probe_set_func[6] = smc_probe_l1i_set6;
    
    mprotect(smc_target_set7_0 - 448, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set7_1 - 448, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set7_2 - 448, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set7_3 - 448, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set7_4 - 448, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set7_5 - 448, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set7_6 - 448, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set7_7 - 448, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[7] = smc_prime_l1i_set7;probe_set_func[7] = smc_probe_l1i_set7;
    
    mprotect(smc_target_set8_0 - 512, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set8_1 - 512, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set8_2 - 512, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set8_3 - 512, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set8_4 - 512, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set8_5 - 512, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set8_6 - 512, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set8_7 - 512, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[8] = smc_prime_l1i_set8;probe_set_func[8] = smc_probe_l1i_set8;
    
    mprotect(smc_target_set9_0 - 576, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set9_1 - 576, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set9_2 - 576, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set9_3 - 576, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set9_4 - 576, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set9_5 - 576, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set9_6 - 576, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set9_7 - 576, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[9] = smc_prime_l1i_set9;probe_set_func[9] = smc_probe_l1i_set9;
    
    mprotect(smc_target_set10_0 - 640, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set10_1 - 640, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set10_2 - 640, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set10_3 - 640, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set10_4 - 640, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set10_5 - 640, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set10_6 - 640, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set10_7 - 640, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[10] = smc_prime_l1i_set10;probe_set_func[10] = smc_probe_l1i_set10;
    
    mprotect(smc_target_set11_0 - 704, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set11_1 - 704, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set11_2 - 704, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set11_3 - 704, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set11_4 - 704, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set11_5 - 704, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set11_6 - 704, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set11_7 - 704, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[11] = smc_prime_l1i_set11;probe_set_func[11] = smc_probe_l1i_set11;
    
    mprotect(smc_target_set12_0 - 768, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set12_1 - 768, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set12_2 - 768, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set12_3 - 768, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set12_4 - 768, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set12_5 - 768, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set12_6 - 768, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set12_7 - 768, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[12] = smc_prime_l1i_set12;probe_set_func[12] = smc_probe_l1i_set12;
    
    mprotect(smc_target_set13_0 - 832, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set13_1 - 832, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set13_2 - 832, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set13_3 - 832, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set13_4 - 832, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set13_5 - 832, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set13_6 - 832, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set13_7 - 832, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[13] = smc_prime_l1i_set13;probe_set_func[13] = smc_probe_l1i_set13;
    
    mprotect(smc_target_set14_0 - 896, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set14_1 - 896, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set14_2 - 896, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set14_3 - 896, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set14_4 - 896, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set14_5 - 896, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set14_6 - 896, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set14_7 - 896, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[14] = smc_prime_l1i_set14;probe_set_func[14] = smc_probe_l1i_set14;
    
    mprotect(smc_target_set15_0 - 960, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set15_1 - 960, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set15_2 - 960, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set15_3 - 960, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set15_4 - 960, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set15_5 - 960, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set15_6 - 960, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set15_7 - 960, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[15] = smc_prime_l1i_set15;probe_set_func[15] = smc_probe_l1i_set15;
    
    mprotect(smc_target_set16_0 - 1024, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set16_1 - 1024, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set16_2 - 1024, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set16_3 - 1024, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set16_4 - 1024, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set16_5 - 1024, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set16_6 - 1024, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set16_7 - 1024, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[16] = smc_prime_l1i_set16;probe_set_func[16] = smc_probe_l1i_set16;
    
    mprotect(smc_target_set17_0 - 1088, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set17_1 - 1088, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set17_2 - 1088, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set17_3 - 1088, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set17_4 - 1088, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set17_5 - 1088, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set17_6 - 1088, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set17_7 - 1088, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[17] = smc_prime_l1i_set17;probe_set_func[17] = smc_probe_l1i_set17;
    
    mprotect(smc_target_set18_0 - 1152, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set18_1 - 1152, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set18_2 - 1152, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set18_3 - 1152, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set18_4 - 1152, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set18_5 - 1152, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set18_6 - 1152, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set18_7 - 1152, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[18] = smc_prime_l1i_set18;probe_set_func[18] = smc_probe_l1i_set18;
    
    mprotect(smc_target_set19_0 - 1216, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set19_1 - 1216, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set19_2 - 1216, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set19_3 - 1216, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set19_4 - 1216, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set19_5 - 1216, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set19_6 - 1216, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set19_7 - 1216, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[19] = smc_prime_l1i_set19;probe_set_func[19] = smc_probe_l1i_set19;
    
    mprotect(smc_target_set20_0 - 1280, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set20_1 - 1280, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set20_2 - 1280, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set20_3 - 1280, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set20_4 - 1280, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set20_5 - 1280, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set20_6 - 1280, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set20_7 - 1280, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[20] = smc_prime_l1i_set20;probe_set_func[20] = smc_probe_l1i_set20;
    
    mprotect(smc_target_set21_0 - 1344, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set21_1 - 1344, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set21_2 - 1344, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set21_3 - 1344, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set21_4 - 1344, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set21_5 - 1344, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set21_6 - 1344, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set21_7 - 1344, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[21] = smc_prime_l1i_set21;probe_set_func[21] = smc_probe_l1i_set21;
    
    mprotect(smc_target_set22_0 - 1408, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set22_1 - 1408, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set22_2 - 1408, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set22_3 - 1408, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set22_4 - 1408, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set22_5 - 1408, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set22_6 - 1408, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set22_7 - 1408, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[22] = smc_prime_l1i_set22;probe_set_func[22] = smc_probe_l1i_set22;
    
    mprotect(smc_target_set23_0 - 1472, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set23_1 - 1472, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set23_2 - 1472, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set23_3 - 1472, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set23_4 - 1472, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set23_5 - 1472, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set23_6 - 1472, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set23_7 - 1472, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[23] = smc_prime_l1i_set23;probe_set_func[23] = smc_probe_l1i_set23;
    
    mprotect(smc_target_set24_0 - 1536, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set24_1 - 1536, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set24_2 - 1536, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set24_3 - 1536, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set24_4 - 1536, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set24_5 - 1536, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set24_6 - 1536, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set24_7 - 1536, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[24] = smc_prime_l1i_set24;probe_set_func[24] = smc_probe_l1i_set24;
    
    mprotect(smc_target_set25_0 - 1600, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set25_1 - 1600, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set25_2 - 1600, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set25_3 - 1600, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set25_4 - 1600, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set25_5 - 1600, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set25_6 - 1600, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set25_7 - 1600, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[25] = smc_prime_l1i_set25;probe_set_func[25] = smc_probe_l1i_set25;
    
    mprotect(smc_target_set26_0 - 1664, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set26_1 - 1664, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set26_2 - 1664, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set26_3 - 1664, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set26_4 - 1664, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set26_5 - 1664, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set26_6 - 1664, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set26_7 - 1664, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[26] = smc_prime_l1i_set26;probe_set_func[26] = smc_probe_l1i_set26;
    
    mprotect(smc_target_set27_0 - 1728, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set27_1 - 1728, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set27_2 - 1728, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set27_3 - 1728, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set27_4 - 1728, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set27_5 - 1728, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set27_6 - 1728, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set27_7 - 1728, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[27] = smc_prime_l1i_set27;probe_set_func[27] = smc_probe_l1i_set27;
    
    mprotect(smc_target_set28_0 - 1792, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set28_1 - 1792, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set28_2 - 1792, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set28_3 - 1792, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set28_4 - 1792, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set28_5 - 1792, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set28_6 - 1792, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set28_7 - 1792, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[28] = smc_prime_l1i_set28;probe_set_func[28] = smc_probe_l1i_set28;
    
    mprotect(smc_target_set29_0 - 1856, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set29_1 - 1856, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set29_2 - 1856, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set29_3 - 1856, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set29_4 - 1856, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set29_5 - 1856, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set29_6 - 1856, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set29_7 - 1856, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[29] = smc_prime_l1i_set29;probe_set_func[29] = smc_probe_l1i_set29;
    
    mprotect(smc_target_set30_0 - 1920, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set30_1 - 1920, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set30_2 - 1920, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set30_3 - 1920, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set30_4 - 1920, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set30_5 - 1920, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set30_6 - 1920, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set30_7 - 1920, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[30] = smc_prime_l1i_set30;probe_set_func[30] = smc_probe_l1i_set30;
    
    mprotect(smc_target_set31_0 - 1984, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set31_1 - 1984, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set31_2 - 1984, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set31_3 - 1984, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set31_4 - 1984, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set31_5 - 1984, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set31_6 - 1984, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set31_7 - 1984, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[31] = smc_prime_l1i_set31;probe_set_func[31] = smc_probe_l1i_set31;
    
    mprotect(smc_target_set32_0 - 2048, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set32_1 - 2048, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set32_2 - 2048, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set32_3 - 2048, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set32_4 - 2048, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set32_5 - 2048, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set32_6 - 2048, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set32_7 - 2048, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[32] = smc_prime_l1i_set32;probe_set_func[32] = smc_probe_l1i_set32;
    
    mprotect(smc_target_set33_0 - 2112, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set33_1 - 2112, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set33_2 - 2112, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set33_3 - 2112, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set33_4 - 2112, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set33_5 - 2112, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set33_6 - 2112, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set33_7 - 2112, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[33] = smc_prime_l1i_set33;probe_set_func[33] = smc_probe_l1i_set33;
    
    mprotect(smc_target_set34_0 - 2176, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set34_1 - 2176, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set34_2 - 2176, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set34_3 - 2176, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set34_4 - 2176, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set34_5 - 2176, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set34_6 - 2176, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set34_7 - 2176, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[34] = smc_prime_l1i_set34;probe_set_func[34] = smc_probe_l1i_set34;
    
    mprotect(smc_target_set35_0 - 2240, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set35_1 - 2240, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set35_2 - 2240, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set35_3 - 2240, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set35_4 - 2240, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set35_5 - 2240, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set35_6 - 2240, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set35_7 - 2240, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[35] = smc_prime_l1i_set35;probe_set_func[35] = smc_probe_l1i_set35;
    
    mprotect(smc_target_set36_0 - 2304, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set36_1 - 2304, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set36_2 - 2304, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set36_3 - 2304, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set36_4 - 2304, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set36_5 - 2304, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set36_6 - 2304, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set36_7 - 2304, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[36] = smc_prime_l1i_set36;probe_set_func[36] = smc_probe_l1i_set36;
    
    mprotect(smc_target_set37_0 - 2368, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set37_1 - 2368, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set37_2 - 2368, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set37_3 - 2368, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set37_4 - 2368, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set37_5 - 2368, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set37_6 - 2368, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set37_7 - 2368, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[37] = smc_prime_l1i_set37;probe_set_func[37] = smc_probe_l1i_set37;
    
    mprotect(smc_target_set38_0 - 2432, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set38_1 - 2432, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set38_2 - 2432, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set38_3 - 2432, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set38_4 - 2432, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set38_5 - 2432, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set38_6 - 2432, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set38_7 - 2432, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[38] = smc_prime_l1i_set38;probe_set_func[38] = smc_probe_l1i_set38;
    
    mprotect(smc_target_set39_0 - 2496, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set39_1 - 2496, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set39_2 - 2496, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set39_3 - 2496, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set39_4 - 2496, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set39_5 - 2496, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set39_6 - 2496, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set39_7 - 2496, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[39] = smc_prime_l1i_set39;probe_set_func[39] = smc_probe_l1i_set39;
    
    mprotect(smc_target_set40_0 - 2560, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set40_1 - 2560, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set40_2 - 2560, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set40_3 - 2560, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set40_4 - 2560, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set40_5 - 2560, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set40_6 - 2560, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set40_7 - 2560, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[40] = smc_prime_l1i_set40;probe_set_func[40] = smc_probe_l1i_set40;
    
    mprotect(smc_target_set41_0 - 2624, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set41_1 - 2624, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set41_2 - 2624, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set41_3 - 2624, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set41_4 - 2624, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set41_5 - 2624, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set41_6 - 2624, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set41_7 - 2624, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[41] = smc_prime_l1i_set41;probe_set_func[41] = smc_probe_l1i_set41;
    
    mprotect(smc_target_set42_0 - 2688, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set42_1 - 2688, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set42_2 - 2688, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set42_3 - 2688, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set42_4 - 2688, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set42_5 - 2688, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set42_6 - 2688, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set42_7 - 2688, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[42] = smc_prime_l1i_set42;probe_set_func[42] = smc_probe_l1i_set42;
    
    mprotect(smc_target_set43_0 - 2752, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set43_1 - 2752, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set43_2 - 2752, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set43_3 - 2752, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set43_4 - 2752, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set43_5 - 2752, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set43_6 - 2752, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set43_7 - 2752, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[43] = smc_prime_l1i_set43;probe_set_func[43] = smc_probe_l1i_set43;
    
    mprotect(smc_target_set44_0 - 2816, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set44_1 - 2816, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set44_2 - 2816, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set44_3 - 2816, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set44_4 - 2816, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set44_5 - 2816, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set44_6 - 2816, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set44_7 - 2816, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[44] = smc_prime_l1i_set44;probe_set_func[44] = smc_probe_l1i_set44;
    
    mprotect(smc_target_set45_0 - 2880, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set45_1 - 2880, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set45_2 - 2880, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set45_3 - 2880, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set45_4 - 2880, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set45_5 - 2880, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set45_6 - 2880, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set45_7 - 2880, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[45] = smc_prime_l1i_set45;probe_set_func[45] = smc_probe_l1i_set45;
    
    mprotect(smc_target_set46_0 - 2944, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set46_1 - 2944, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set46_2 - 2944, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set46_3 - 2944, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set46_4 - 2944, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set46_5 - 2944, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set46_6 - 2944, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set46_7 - 2944, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[46] = smc_prime_l1i_set46;probe_set_func[46] = smc_probe_l1i_set46;
    
    mprotect(smc_target_set47_0 - 3008, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set47_1 - 3008, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set47_2 - 3008, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set47_3 - 3008, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set47_4 - 3008, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set47_5 - 3008, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set47_6 - 3008, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set47_7 - 3008, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[47] = smc_prime_l1i_set47;probe_set_func[47] = smc_probe_l1i_set47;
    
    mprotect(smc_target_set48_0 - 3072, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set48_1 - 3072, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set48_2 - 3072, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set48_3 - 3072, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set48_4 - 3072, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set48_5 - 3072, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set48_6 - 3072, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set48_7 - 3072, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[48] = smc_prime_l1i_set48;probe_set_func[48] = smc_probe_l1i_set48;
    
    mprotect(smc_target_set49_0 - 3136, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set49_1 - 3136, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set49_2 - 3136, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set49_3 - 3136, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set49_4 - 3136, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set49_5 - 3136, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set49_6 - 3136, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set49_7 - 3136, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[49] = smc_prime_l1i_set49;probe_set_func[49] = smc_probe_l1i_set49;
    
    mprotect(smc_target_set50_0 - 3200, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set50_1 - 3200, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set50_2 - 3200, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set50_3 - 3200, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set50_4 - 3200, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set50_5 - 3200, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set50_6 - 3200, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set50_7 - 3200, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[50] = smc_prime_l1i_set50;probe_set_func[50] = smc_probe_l1i_set50;
    
    mprotect(smc_target_set51_0 - 3264, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set51_1 - 3264, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set51_2 - 3264, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set51_3 - 3264, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set51_4 - 3264, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set51_5 - 3264, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set51_6 - 3264, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set51_7 - 3264, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[51] = smc_prime_l1i_set51;probe_set_func[51] = smc_probe_l1i_set51;
    
    mprotect(smc_target_set52_0 - 3328, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set52_1 - 3328, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set52_2 - 3328, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set52_3 - 3328, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set52_4 - 3328, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set52_5 - 3328, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set52_6 - 3328, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set52_7 - 3328, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[52] = smc_prime_l1i_set52;probe_set_func[52] = smc_probe_l1i_set52;
    
    mprotect(smc_target_set53_0 - 3392, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set53_1 - 3392, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set53_2 - 3392, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set53_3 - 3392, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set53_4 - 3392, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set53_5 - 3392, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set53_6 - 3392, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set53_7 - 3392, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[53] = smc_prime_l1i_set53;probe_set_func[53] = smc_probe_l1i_set53;
    
    mprotect(smc_target_set54_0 - 3456, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set54_1 - 3456, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set54_2 - 3456, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set54_3 - 3456, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set54_4 - 3456, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set54_5 - 3456, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set54_6 - 3456, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set54_7 - 3456, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[54] = smc_prime_l1i_set54;probe_set_func[54] = smc_probe_l1i_set54;
    
    mprotect(smc_target_set55_0 - 3520, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set55_1 - 3520, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set55_2 - 3520, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set55_3 - 3520, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set55_4 - 3520, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set55_5 - 3520, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set55_6 - 3520, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set55_7 - 3520, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[55] = smc_prime_l1i_set55;probe_set_func[55] = smc_probe_l1i_set55;
    
    mprotect(smc_target_set56_0 - 3584, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set56_1 - 3584, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set56_2 - 3584, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set56_3 - 3584, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set56_4 - 3584, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set56_5 - 3584, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set56_6 - 3584, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set56_7 - 3584, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[56] = smc_prime_l1i_set56;probe_set_func[56] = smc_probe_l1i_set56;
    
    mprotect(smc_target_set57_0 - 3648, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set57_1 - 3648, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set57_2 - 3648, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set57_3 - 3648, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set57_4 - 3648, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set57_5 - 3648, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set57_6 - 3648, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set57_7 - 3648, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[57] = smc_prime_l1i_set57;probe_set_func[57] = smc_probe_l1i_set57;
    
    mprotect(smc_target_set58_0 - 3712, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set58_1 - 3712, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set58_2 - 3712, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set58_3 - 3712, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set58_4 - 3712, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set58_5 - 3712, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set58_6 - 3712, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set58_7 - 3712, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[58] = smc_prime_l1i_set58;probe_set_func[58] = smc_probe_l1i_set58;
    
    mprotect(smc_target_set59_0 - 3776, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set59_1 - 3776, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set59_2 - 3776, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set59_3 - 3776, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set59_4 - 3776, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set59_5 - 3776, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set59_6 - 3776, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set59_7 - 3776, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[59] = smc_prime_l1i_set59;probe_set_func[59] = smc_probe_l1i_set59;
    
    mprotect(smc_target_set60_0 - 3840, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set60_1 - 3840, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set60_2 - 3840, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set60_3 - 3840, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set60_4 - 3840, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set60_5 - 3840, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set60_6 - 3840, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set60_7 - 3840, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[60] = smc_prime_l1i_set60;probe_set_func[60] = smc_probe_l1i_set60;
    
    mprotect(smc_target_set61_0 - 3904, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set61_1 - 3904, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set61_2 - 3904, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set61_3 - 3904, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set61_4 - 3904, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set61_5 - 3904, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set61_6 - 3904, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set61_7 - 3904, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[61] = smc_prime_l1i_set61;probe_set_func[61] = smc_probe_l1i_set61;
    
    mprotect(smc_target_set62_0 - 3968, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set62_1 - 3968, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set62_2 - 3968, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set62_3 - 3968, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set62_4 - 3968, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set62_5 - 3968, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set62_6 - 3968, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set62_7 - 3968, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[62] = smc_prime_l1i_set62;probe_set_func[62] = smc_probe_l1i_set62;
    
    mprotect(smc_target_set63_0 - 4032, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set63_1 - 4032, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set63_2 - 4032, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set63_3 - 4032, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set63_4 - 4032, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set63_5 - 4032, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set63_6 - 4032, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    mprotect(smc_target_set63_7 - 4032, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    prime_set_func[63] = smc_prime_l1i_set63;probe_set_func[63] = smc_probe_l1i_set63;
    
    
}