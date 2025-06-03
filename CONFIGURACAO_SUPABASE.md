# Configuração do Supabase para Reset de Senha - App Profissional

## Problema Identificado
O link de redefinição de senha estava redirecionando para o aplicativo do morador em vez do aplicativo do profissional.

## Solução Implementada

### 1. Alteração no Código
- **Arquivo**: `lib/paginas/autenticacao/esqueci_senha/esqueci_senha_widget.dart`
- **Linha**: ~371
- **Alteração**: 
  ```dart
  // ANTES:
  redirectTo: "https://indic-az-5nnic8.flutterflow.app/novaSenha"
  
  // DEPOIS:
  redirectTo: "https://indicazpara-profissionais-i18qr1.flutterflow.app/novaSenha"
  ```

### 2. Configuração no Supabase Dashboard

Acesse o Supabase Dashboard e adicione as seguintes URLs na seção **Authentication > URL Configuration > Redirect URLs**:

#### URLs para Adicionar:
1. `https://indicazpara-profissionais-i18qr1.flutterflow.app/novaSenha`
2. `https://indicazpara-profissionais-i18qr1.flutterflow.app/resetPassword`
3. `indicazprofissionais://indicazprofissionais.com/novaSenha` (para deep link)
4. `indicazprofissionais://indicazprofissionais.com/resetPassword` (para deep link)

#### Passos:
1. Acesse: https://supabase.com/dashboard/project/[SEU_PROJECT_ID]/auth/url-configuration
2. Na seção "Redirect URLs", clique em "Add URL"
3. Adicione cada uma das URLs listadas acima
4. Clique em "Save" após adicionar todas

### 3. Configuração do Site URL
Certifique-se de que o **Site URL** esteja configurado como:
```
https://indicazpara-profissionais-i18qr1.flutterflow.app
```

### 4. Teste do Fluxo
1. Usuário acessa a tela "Esqueci Senha"
2. Insere o email
3. Clica em "Enviar"
4. Recebe email com link
5. Clica no link do email
6. É redirecionado para a tela "Nova Senha" do app PROFISSIONAL
7. Define nova senha
8. É redirecionado para login

### 5. URLs de Fallback (Opcional)
Se ainda houver problemas, você pode também adicionar:
- `https://indicazpara-profissionais-i18qr1.flutterflow.app/*` (wildcard)
- `indicazprofissionais://*` (wildcard para deep link)

## Verificação
Após fazer essas configurações:
1. Teste o fluxo de reset de senha
2. Verifique se o link do email redireciona para o app correto
3. Confirme se a tela "Nova Senha" abre corretamente

## Observações
- A URL `https://indicazpara-profissionais-i18qr1.flutterflow.app` é específica para o aplicativo do profissional
- A URL anterior `https://indic-az-5nnic8.flutterflow.app` estava apontando para o aplicativo do morador
- O deep link `indicazprofissionais://` garante que funcione quando o app estiver instalado
- **IMPORTANTE**: Como ambos os apps (profissional e morador) usam o mesmo banco Supabase, é crucial configurar as URLs corretas para cada aplicativo 