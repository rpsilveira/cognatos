unit U_Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects;

type
  TF_Principal = class(TForm)
    lblPalavra: TLabel;
    btnOpcao1: TButton;
    btnOpcao2: TButton;
    btnOpcao3: TButton;
    lblAcertos: TLabel;
    lblErros: TLabel;
    Rectangle1: TRectangle;
    lblBottom: TLabel;
    procedure btnOpcao1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    var intAcertos, intErros: Integer;
    procedure Embaralha;
  public
    { Public declarations }
  end;

const
  palavra: Array [0..19] of String = ('Resume',
                                      'Argument',
                                      'Prejudice',
                                      'Tax',
                                      'Contest',
                                      'Office',
                                      'Eventually',
                                      'Lecture',
                                      'Sensible',
                                      'Parents',
                                      'Pretend',
                                      'Intend',
                                      'Ingenious',
                                      'Support',
                                      'Assume',
                                      'Dependable',
                                      'Balcony',
                                      'Realize',
                                      'Injury',
                                      'Flagrant');

  opcao: Array [0..19] of Array [0..2] of String = ( ('Retomar', 'Resumir', 'Refazer'),
                                                     ('Discussão', 'Argumento', 'Disposição'),
                                                     ('Preconceiro', 'Prejudicar', 'Prejuízo'),
                                                     ('Imposto', 'Táxi', 'Texto'),
                                                     ('Competição', 'Contexto', 'Contestar'),
                                                     ('Escritório', 'Ofício', 'Oficial'),
                                                     ('Finalmente', 'Eventualmente', 'Evidentemente'),
                                                     ('Palestra', 'Leitura', 'Lição'),
                                                     ('Sensato', 'Sensível', 'Sincero'),
                                                     ('Pais', 'Parentes', 'Presentes'),
                                                     ('Fingir', 'Pretender', 'Pronunciar'),
                                                     ('Pretender', 'Entender', 'Intrometer'),
                                                     ('Engenhoso', 'Ingênuo', 'Estudioso'),
                                                     ('Apoiar', 'Suportar', 'Separar'),
                                                     ('Presumir', 'Assumir', 'Somar'),
                                                     ('Confiável', 'Dependente', 'Independente'),
                                                     ('Sacada', 'Balcão', 'Balconista'),
                                                     ('Perceber', 'Realizar', 'Conquistar'),
                                                     ('Ferimento', 'Injúria', 'Jurar'),
                                                     ('Escandaloso', 'Flagrante', 'Frequente') );

  quantPalavras = Length(palavra);
  quantOpcoes   = 3;

var
  F_Principal: TF_Principal;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}

{ TF_Principal }

procedure TF_Principal.btnOpcao1Click(Sender: TObject);
begin
  if TButton(Sender).Tag = 0 then
  begin
    Inc(intAcertos);
    lblAcertos.Text := Format('Acertos: %d', [intAcertos]);
  end
  else
  begin
    Inc(intErros);
    lblErros.Text := Format('Erros: %d', [intErros]);
  end;

  Embaralha;
end;

procedure TF_Principal.Embaralha;
var
  idxPalavra, idxOp1, idxOp2, idxOp3: SmallInt;
begin
  Randomize;

  idxPalavra := Random(quantPalavras);

  while idxPalavra = lblPalavra.Tag do
    idxPalavra := Random(quantPalavras);

  lblPalavra.Text := palavra[idxPalavra];
  lblPalavra.Tag  := idxPalavra;

  idxOp1 := Random(quantOpcoes);
  idxOp2 := Random(quantOpcoes);
  idxOp3 := Random(quantOpcoes);

  while idxOp2 = idxOp1 do
    idxOp2 := Random(quantOpcoes);

  while (idxOp3 = idxOp1) or (idxOp3 = idxOp2) do
    idxOp3 := Random(quantOpcoes);

  btnOpcao1.Text := opcao[idxPalavra, idxOp1];
  btnOpcao1.Tag  := idxOp1;

  btnOpcao2.Text := opcao[idxPalavra, idxOp2];
  btnOpcao2.Tag  := idxOp2;

  btnOpcao3.Text := opcao[idxPalavra, idxOp3];
  btnOpcao3.Tag  := idxOp3;
end;

procedure TF_Principal.FormShow(Sender: TObject);
begin
  intAcertos := 0;
  intErros   := 0;

  Embaralha;
end;

end.
