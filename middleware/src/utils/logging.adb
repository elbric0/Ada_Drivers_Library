------------------------------------------------------------------------------
--                                                                          --
--                        Copyright (C) 2017, AdaCore                       --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

with Logging_With_Categories;
with Logging_With_Priority;

package body Logging is

   package Log_Prio is new Logging_With_Priority (Priorities,
                                                  Maximum_Message_Length,
                                                  Maximum_Number_Of_Messages);

   package Log_Categories  is new Logging_With_Categories
        (Categories,
         Priorities,
         Default_Category,
         Default_Priority,
         Categories_Enabled_By_Default,
         Prefix_Enabled_By_Default,
         Log_Line_Backend              => Log_Prio.Log_Line);

   procedure Log_Line (Cat : Categories; Str : String) renames Log_Categories.Log_Line;
   procedure Log_Line (Str : String) renames Log_Categories.Log_Line;
   function Enabled (Cat : Categories) return Boolean renames Log_Categories.Enabled;
   procedure Enable (Cat : Categories) renames Log_Categories.Enable;
   procedure Disable (Cat : Categories) renames Log_Categories.Disable;
   procedure Enable_Prefix (Cat : Categories) renames Log_Categories.Enable_Prefix;
   procedure Disable_Prefix (Cat : Categories) renames Log_Categories.Disable_Prefix;
   function Priority (Cat : Categories) return Priorities renames Log_Categories.Priority;
   procedure Set_Priority (Cat : Categories; Prio : Priorities) renames Log_Categories.Set_Priority;

   procedure Pop (Str    : out String;
                  Length : out Natural;
                  Prio   : out Priorities)
                  renames Log_Prio.Pop;

end Logging;
