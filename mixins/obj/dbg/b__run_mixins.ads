pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Community 2018 (20180524-73)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_run_mixins" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#d7dddd25#;
   pragma Export (C, u00001, "run_mixinsB");
   u00002 : constant Version_32 := 16#050ff2f0#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#4113f22b#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#b66608ad#;
   pragma Export (C, u00005, "ada__exceptionsB");
   u00006 : constant Version_32 := 16#585ef86b#;
   pragma Export (C, u00006, "ada__exceptionsS");
   u00007 : constant Version_32 := 16#5726abed#;
   pragma Export (C, u00007, "ada__exceptions__last_chance_handlerB");
   u00008 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00008, "ada__exceptions__last_chance_handlerS");
   u00009 : constant Version_32 := 16#4635ec04#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00010, "system__soft_linksB");
   u00011 : constant Version_32 := 16#0336e7b2#;
   pragma Export (C, u00011, "system__soft_linksS");
   u00012 : constant Version_32 := 16#f32b4133#;
   pragma Export (C, u00012, "system__secondary_stackB");
   u00013 : constant Version_32 := 16#03a1141d#;
   pragma Export (C, u00013, "system__secondary_stackS");
   u00014 : constant Version_32 := 16#86dbf443#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#0ed9b82f#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00016, "system__storage_elementsB");
   u00017 : constant Version_32 := 16#6bf6a600#;
   pragma Export (C, u00017, "system__storage_elementsS");
   u00018 : constant Version_32 := 16#75bf515c#;
   pragma Export (C, u00018, "system__soft_links__initializeB");
   u00019 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00019, "system__soft_links__initializeS");
   u00020 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#c88a87ec#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#1b9b8546#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00024, "system__exceptionsB");
   u00025 : constant Version_32 := 16#2e5681f2#;
   pragma Export (C, u00025, "system__exceptionsS");
   u00026 : constant Version_32 := 16#80916427#;
   pragma Export (C, u00026, "system__exceptions__machineB");
   u00027 : constant Version_32 := 16#3bad9081#;
   pragma Export (C, u00027, "system__exceptions__machineS");
   u00028 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00028, "system__exceptions_debugB");
   u00029 : constant Version_32 := 16#38bf15c0#;
   pragma Export (C, u00029, "system__exceptions_debugS");
   u00030 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00030, "system__img_intB");
   u00031 : constant Version_32 := 16#44ee0cc6#;
   pragma Export (C, u00031, "system__img_intS");
   u00032 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00032, "system__tracebackB");
   u00033 : constant Version_32 := 16#181732c0#;
   pragma Export (C, u00033, "system__tracebackS");
   u00034 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00034, "system__traceback_entriesB");
   u00035 : constant Version_32 := 16#466e1a74#;
   pragma Export (C, u00035, "system__traceback_entriesS");
   u00036 : constant Version_32 := 16#448e9548#;
   pragma Export (C, u00036, "system__traceback__symbolicB");
   u00037 : constant Version_32 := 16#c84061d1#;
   pragma Export (C, u00037, "system__traceback__symbolicS");
   u00038 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00038, "ada__containersS");
   u00039 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00039, "ada__exceptions__tracebackB");
   u00040 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00040, "ada__exceptions__tracebackS");
   u00041 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00041, "interfacesS");
   u00042 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00042, "interfaces__cB");
   u00043 : constant Version_32 := 16#467817d8#;
   pragma Export (C, u00043, "interfaces__cS");
   u00044 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00044, "system__bounded_stringsB");
   u00045 : constant Version_32 := 16#31c8cd1d#;
   pragma Export (C, u00045, "system__bounded_stringsS");
   u00046 : constant Version_32 := 16#0062635e#;
   pragma Export (C, u00046, "system__crtlS");
   u00047 : constant Version_32 := 16#a14b18bf#;
   pragma Export (C, u00047, "system__dwarf_linesB");
   u00048 : constant Version_32 := 16#809452f5#;
   pragma Export (C, u00048, "system__dwarf_linesS");
   u00049 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00049, "ada__charactersS");
   u00050 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00050, "ada__characters__handlingB");
   u00051 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00051, "ada__characters__handlingS");
   u00052 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00052, "ada__characters__latin_1S");
   u00053 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00053, "ada__stringsS");
   u00054 : constant Version_32 := 16#96df1a3f#;
   pragma Export (C, u00054, "ada__strings__mapsB");
   u00055 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00055, "ada__strings__mapsS");
   u00056 : constant Version_32 := 16#d68fb8f1#;
   pragma Export (C, u00056, "system__bit_opsB");
   u00057 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00057, "system__bit_opsS");
   u00058 : constant Version_32 := 16#72b39087#;
   pragma Export (C, u00058, "system__unsigned_typesS");
   u00059 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00059, "ada__strings__maps__constantsS");
   u00060 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00060, "system__address_imageB");
   u00061 : constant Version_32 := 16#e7d9713e#;
   pragma Export (C, u00061, "system__address_imageS");
   u00062 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00062, "system__img_unsB");
   u00063 : constant Version_32 := 16#ed47ac70#;
   pragma Export (C, u00063, "system__img_unsS");
   u00064 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00064, "system__ioB");
   u00065 : constant Version_32 := 16#d8771b4b#;
   pragma Export (C, u00065, "system__ioS");
   u00066 : constant Version_32 := 16#f790d1ef#;
   pragma Export (C, u00066, "system__mmapB");
   u00067 : constant Version_32 := 16#7c445363#;
   pragma Export (C, u00067, "system__mmapS");
   u00068 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00068, "ada__io_exceptionsS");
   u00069 : constant Version_32 := 16#917e91ec#;
   pragma Export (C, u00069, "system__mmap__os_interfaceB");
   u00070 : constant Version_32 := 16#1f56acd1#;
   pragma Export (C, u00070, "system__mmap__os_interfaceS");
   u00071 : constant Version_32 := 16#1ee9caf8#;
   pragma Export (C, u00071, "system__mmap__unixS");
   u00072 : constant Version_32 := 16#41e61106#;
   pragma Export (C, u00072, "system__os_libB");
   u00073 : constant Version_32 := 16#d8e681fb#;
   pragma Export (C, u00073, "system__os_libS");
   u00074 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00074, "system__case_utilB");
   u00075 : constant Version_32 := 16#79e05a50#;
   pragma Export (C, u00075, "system__case_utilS");
   u00076 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00076, "system__stringsB");
   u00077 : constant Version_32 := 16#2623c091#;
   pragma Export (C, u00077, "system__stringsS");
   u00078 : constant Version_32 := 16#40d3d043#;
   pragma Export (C, u00078, "system__object_readerB");
   u00079 : constant Version_32 := 16#98adb271#;
   pragma Export (C, u00079, "system__object_readerS");
   u00080 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00080, "system__val_lliB");
   u00081 : constant Version_32 := 16#dc110aa4#;
   pragma Export (C, u00081, "system__val_lliS");
   u00082 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00082, "system__val_lluB");
   u00083 : constant Version_32 := 16#0841c7f5#;
   pragma Export (C, u00083, "system__val_lluS");
   u00084 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00084, "system__val_utilB");
   u00085 : constant Version_32 := 16#ea955afa#;
   pragma Export (C, u00085, "system__val_utilS");
   u00086 : constant Version_32 := 16#d7bf3f29#;
   pragma Export (C, u00086, "system__exception_tracesB");
   u00087 : constant Version_32 := 16#62eacc9e#;
   pragma Export (C, u00087, "system__exception_tracesS");
   u00088 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00088, "system__wch_conB");
   u00089 : constant Version_32 := 16#5d48ced6#;
   pragma Export (C, u00089, "system__wch_conS");
   u00090 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00090, "system__wch_stwB");
   u00091 : constant Version_32 := 16#7059e2d7#;
   pragma Export (C, u00091, "system__wch_stwS");
   u00092 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00092, "system__wch_cnvB");
   u00093 : constant Version_32 := 16#52ff7425#;
   pragma Export (C, u00093, "system__wch_cnvS");
   u00094 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00094, "system__wch_jisB");
   u00095 : constant Version_32 := 16#d28f6d04#;
   pragma Export (C, u00095, "system__wch_jisS");
   u00096 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00096, "ada__streamsB");
   u00097 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00097, "ada__streamsS");
   u00098 : constant Version_32 := 16#d398a95f#;
   pragma Export (C, u00098, "ada__tagsB");
   u00099 : constant Version_32 := 16#12a0afb8#;
   pragma Export (C, u00099, "ada__tagsS");
   u00100 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00100, "system__htableB");
   u00101 : constant Version_32 := 16#c2f75fee#;
   pragma Export (C, u00101, "system__htableS");
   u00102 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00102, "system__string_hashB");
   u00103 : constant Version_32 := 16#60a93490#;
   pragma Export (C, u00103, "system__string_hashS");
   u00104 : constant Version_32 := 16#927a893f#;
   pragma Export (C, u00104, "ada__text_ioB");
   u00105 : constant Version_32 := 16#5194351e#;
   pragma Export (C, u00105, "ada__text_ioS");
   u00106 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00106, "interfaces__c_streamsB");
   u00107 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00107, "interfaces__c_streamsS");
   u00108 : constant Version_32 := 16#ec083f01#;
   pragma Export (C, u00108, "system__file_ioB");
   u00109 : constant Version_32 := 16#e1440d61#;
   pragma Export (C, u00109, "system__file_ioS");
   u00110 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00110, "ada__finalizationS");
   u00111 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00111, "system__finalization_rootB");
   u00112 : constant Version_32 := 16#09c79f94#;
   pragma Export (C, u00112, "system__finalization_rootS");
   u00113 : constant Version_32 := 16#bbaa76ac#;
   pragma Export (C, u00113, "system__file_control_blockS");
   u00114 : constant Version_32 := 16#63bdc7c5#;
   pragma Export (C, u00114, "base_ifaceS");
   u00115 : constant Version_32 := 16#d96e3c40#;
   pragma Export (C, u00115, "system__finalization_mastersB");
   u00116 : constant Version_32 := 16#1dc9d5ce#;
   pragma Export (C, u00116, "system__finalization_mastersS");
   u00117 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00117, "system__img_boolB");
   u00118 : constant Version_32 := 16#b3ec9def#;
   pragma Export (C, u00118, "system__img_boolS");
   u00119 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00119, "system__storage_poolsB");
   u00120 : constant Version_32 := 16#65d872a9#;
   pragma Export (C, u00120, "system__storage_poolsS");
   u00121 : constant Version_32 := 16#3f444167#;
   pragma Export (C, u00121, "base_typeB");
   u00122 : constant Version_32 := 16#d68fdd46#;
   pragma Export (C, u00122, "base_typeS");
   u00123 : constant Version_32 := 16#13c58064#;
   pragma Export (C, u00123, "generic_mixinB");
   u00124 : constant Version_32 := 16#7279322a#;
   pragma Export (C, u00124, "generic_mixinS");
   u00125 : constant Version_32 := 16#eaae6f1c#;
   pragma Export (C, u00125, "generic_mixin_compositorB");
   u00126 : constant Version_32 := 16#546d5d0b#;
   pragma Export (C, u00126, "generic_mixin_compositorS");
   u00127 : constant Version_32 := 16#c5aa720e#;
   pragma Export (C, u00127, "oop_mixin_compositorB");
   u00128 : constant Version_32 := 16#7d551fff#;
   pragma Export (C, u00128, "oop_mixin_compositorS");
   u00129 : constant Version_32 := 16#a9bc3703#;
   pragma Export (C, u00129, "oop_mixinB");
   u00130 : constant Version_32 := 16#a47e67af#;
   pragma Export (C, u00130, "oop_mixinS");
   u00131 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00131, "system__concat_2B");
   u00132 : constant Version_32 := 16#44953bd4#;
   pragma Export (C, u00132, "system__concat_2S");
   u00133 : constant Version_32 := 16#2323a8af#;
   pragma Export (C, u00133, "system__memoryB");
   u00134 : constant Version_32 := 16#1f488a30#;
   pragma Export (C, u00134, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.case_util%s
   --  system.standard_library%s
   --  system.exception_traces%s
   --  ada.exceptions%s
   --  system.wch_stw%s
   --  system.val_util%s
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.os_lib%s
   --  system.bit_ops%s
   --  ada.characters.handling%s
   --  ada.exceptions.traceback%s
   --  system.secondary_stack%s
   --  system.case_util%b
   --  system.address_image%s
   --  system.bounded_strings%s
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.containers%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  ada.exceptions.last_chance_handler%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.wch_stw%b
   --  system.val_util%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.os_lib%b
   --  system.bit_ops%b
   --  ada.strings.maps%s
   --  ada.strings.maps.constants%s
   --  ada.characters.handling%b
   --  interfaces.c%s
   --  ada.exceptions.traceback%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  system.bounded_strings%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  ada.exceptions.last_chance_handler%b
   --  system.standard_library%b
   --  system.mmap%s
   --  ada.strings.maps%b
   --  interfaces.c%b
   --  system.object_reader%s
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.mmap.unix%s
   --  system.mmap.os_interface%s
   --  system.mmap%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.object_reader%b
   --  system.mmap.os_interface%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  base_iface%s
   --  base_type%s
   --  base_type%b
   --  generic_mixin%s
   --  generic_mixin%b
   --  generic_mixin_compositor%s
   --  generic_mixin_compositor%b
   --  oop_mixin%s
   --  oop_mixin%b
   --  oop_mixin_compositor%s
   --  oop_mixin_compositor%b
   --  run_mixins%b
   --  END ELABORATION ORDER

end ada_main;
