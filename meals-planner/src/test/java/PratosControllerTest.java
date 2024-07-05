import com.example.mealsplanner.controller.PratosController;
import com.example.mealsplanner.domain.pratos.PratoDTO;
import com.example.mealsplanner.domain.pratos.Pratos;
import com.example.mealsplanner.service.PratosService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;
import org.springframework.web.client.HttpServerErrorException;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
public class PratosControllerTest {

    @Mock
    private PratosService pratosService;
    @InjectMocks
    private PratosController pratosController;

    @BeforeEach
    public void init() {
        PratosService pratosService = mock(PratosService.class);
        pratosController = new PratosController(pratosService);
    }

    @Test
    @DisplayName("Listar pratos")
    public void testListarPratosSucesso() {
        List<Pratos> result = pratosController.listarTodosPratos();
        assertNotNull(result);
    }
    @Test
    @DisplayName("Listar pratos lança exceção")
    public void testListarPratosFalha() throws HttpServerErrorException {

        when(pratosService.buscarTodosPratos()).thenThrow(HttpServerErrorException.class);
        assertThrows(HttpServerErrorException.class, () -> pratosController.listarTodosPratos());
    }

    @Test
    @DisplayName("Listar pratos por caloria")
    public void testListaPratosPorCaloriaSucesso() {
        List<Pratos> result = pratosController.filtrarPratos(new BigDecimal("30.00"));
        assertNotNull(result);
    }

    @Test
    @DisplayName("Listar pratos individuais")
    public void testListaPratosIndividuaisSucesso() {
        Pratos result = pratosController.listarTodosPratos(1L);
        assertNotNull(result);
    }

    @Test
    @DisplayName("Listar pratos lança exceção")
    public void testListarPratosIndividuaisFalha() throws HttpServerErrorException {
        when(pratosService.buscarPratosPorId(1l)).thenThrow(HttpServerErrorException.class);

        assertThrows(HttpServerErrorException.class, () -> pratosController.listarTodosPratos(1L));

    }

    @Test
    @DisplayName("Listar Pratos que não existe")
    public void testListarAlimentosInexistente() {
        when(pratosService.buscarPratosPorId(10000L)).thenReturn(null);

        Pratos result = pratosController.listarTodosPratos(10000L);
        assertNull(result);
    }

    @Test
    @DisplayName("Cadastrando Pratos com sucesso")
    public void cadastrarBebida() {
        PratoDTO pratoDTO = new PratoDTO(
                "Bolo de chocolate",
                "lanche da tarde",
                new BigDecimal("30.00"),
                new BigDecimal("5.00"),
                new BigDecimal("100.00"),
                new BigDecimal("23.00"),
                new BigDecimal("4.00"),
                new BigDecimal("124.00"),
                new BigDecimal("0.00")
        );

        //when(pratosService.cadastroAlimento(any(AlimentosDTO.class))).thenReturn(true);

        boolean resultado = pratosController.cadastrarPrato(pratoDTO);

        assertTrue(resultado, "Deveria cadastrar o alimento com sucesso");
    }

    @Test
    @DisplayName("Cadastrando Pratos com falha")
    public void cadastrarBebidaComFalha() {
        PratoDTO pratoDTO = new PratoDTO(
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null
        );

        when(pratosService.cadastroPrato(any(PratoDTO.class))).thenReturn(false);

        Boolean bool = pratosController.cadastrarPrato(pratoDTO);
        assertFalse(bool);
    }

}