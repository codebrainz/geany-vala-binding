# Distributed under GNU GPL v2+, see COPYING and AUTHORS for details

# Replicate Automake's AM_V_*
V				?= 0
AM_V_CC			= $(am_v_cc_$(V))
am_v_cc_0		= @echo "  CC $@";
am_v_cc_1		= 
AM_V_LD			= $(am_v_ld_$(V))
am_v_ld_0		= @echo "  LD $@";
am_v_ld_1		= 
AM_V_TARGET		= $(am_v_target_$(V))
am_v_target_0	= @echo "  $@" | tr '[:lower:]' '[:upper:]';
am_v_target_1	= 
AM_V_GEN		= $(am_v_gen_$(V))
am_v_gen_0		= @echo " GEN $@";
am_v_gen_1		= 
