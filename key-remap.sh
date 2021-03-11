#! /bin/bash
hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x7000000e3,
      "HIDKeyboardModifierMappingDst":0x7000000e1},
     {"HIDKeyboardModifierMappingSrc":0x7000000e1,
      "HIDKeyboardModifierMappingDst":0x7000000e0}
    ]
}'
