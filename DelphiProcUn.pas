unit DelphiProcUn;

interface

Uses  Windows, Forms, SysUtils;

//  „астота встроенного таймера = 1193180 √ц
Const F_Timer = 1193180;                        // √ц

Procedure ExBeep(Freq {Hz}, Duration {ms} : Word);
//Procedure Sound(Anti_Herz : Word);
//Procedure NoSound;

implementation

procedure ExBeep(Freq {Hz}, Duration {ms} : Word);
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT
    then Windows.Beep(Freq, Duration)           // NT
    else
      begin                                     // 95/98
        asm
          movzx ecx,Freq
          mov eax,1193180
          sub edx,edx
          div ecx
          mov ecx,eax
          mov al,182
          out 43h,al
          mov al,cl
          out 42h,al
          mov al,ch
          out 42h,al
          in al,61h
          or al,3
          out 61h,al
        end;
        sleep(Duration);
        asm
          in al,61h
          and al,0fch
          out 61h,al
        end;
      end;
end;      { ExBeep }


(*
Procedure Sound(Anti_Herz : Word);
//   Anti_Herz := F_Timer div Herz;
//   т.е. частота встроенного таймера деленна€ на частоту,
//   определ€ющую заданную ноту
Begin
  asm
    mov   al,0b6h
    out   43h,al

    mov   ax,Anti_Herz
    out   42h,al
    mov   al,ah
    out   42h,al

    in    al,61h
    or    al,3
    out   61h,al
  end;
End;      { Sound }

Procedure NoSound;
Begin
  asm
    and   al,11111100b
    out   61h,al
  end
End;      { NoSound }
*)


END.
