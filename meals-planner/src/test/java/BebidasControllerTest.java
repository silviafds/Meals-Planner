import com.example.mealsplanner.controller.BebidasController;
import com.example.mealsplanner.domain.bebidas.BebidaDTO;
import com.example.mealsplanner.domain.bebidas.Bebidas;
import com.example.mealsplanner.service.BebidasService;
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

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.math.BigDecimal;
import java.util.List;

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
public class BebidasControllerTest {

    @Mock
    private BebidasService bebidasService;
    @InjectMocks
    private BebidasController bebidasController;

    @BeforeEach
    public void init() {
        BebidasService bebidasService = mock(BebidasService.class);
        bebidasController = new BebidasController(bebidasService);
    }

    @Test
    @DisplayName("Listar bebidas")
    public void testListarBebidasSucesso() {
        List<Bebidas> result = bebidasController.listarTodosBebidas();
        assertNotNull(result);
    }
    @Test
    @DisplayName("Listar bebidas lança exceção")
    public void testListarAlimentosFalha() throws HttpServerErrorException {

        when(bebidasService.buscarTodosBebidas()).thenThrow(HttpServerErrorException.class);
        assertThrows(HttpServerErrorException.class, () -> bebidasController.listarTodosBebidas());
    }

    @Test
    @DisplayName("Listar alimentos individuais")
    public void testListarAlimentosIndividuaisSucesso() {
        Bebidas result = bebidasController.listarTodosBebidas(1L);
        assertNotNull(result);
    }

    @Test
    @DisplayName("Listar bebidas lança exceção")
    public void testListarBebidasIndividuaisFalha() throws HttpServerErrorException {
        when(bebidasService.buscarBebidasPorId(1l)).thenThrow(HttpServerErrorException.class);

        assertThrows(HttpServerErrorException.class, () -> bebidasController.listarTodosBebidas(1L));

    }

    @Test
    @DisplayName("Listar bebidas que não existe")
    public void testListarAlimentosInexistente() {
        when(bebidasService.buscarBebidasPorId(10000L)).thenReturn(null);

        Bebidas result = bebidasController.listarTodosBebidas(10000L);
        assertNull(result);
    }

    @Test
    @DisplayName("Cadastrando bebidas com sucesso")
    public void cadastrarBebida() {
        BebidaDTO bebidaDTO = new BebidaDTO(
                "Vinho branco",
                "Alcoolica",
                new BigDecimal("30.00"),
                new BigDecimal("5.00"),
                new BigDecimal("100.00"),
                new BigDecimal("23.00"),
                new BigDecimal("4.00"),
                new BigDecimal("124.00"),
                new BigDecimal("0.00")
        );

        //when(BebidasService.cadastroAlimento(any(AlimentosDTO.class))).thenReturn(true);

        boolean resultado = bebidasController.cadastrarBebida(bebidaDTO);

        assertTrue(resultado, "Deveria cadastrar o alimento com sucesso");
    }

    @Test
    @DisplayName("Cadastrando bebidas com falha")
    public void cadastrarBebidaComFalha() {
        BebidaDTO bebidaDTO = new BebidaDTO(
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

        when(bebidasService.cadastrarBebida(any(BebidaDTO.class))).thenReturn(false);

        Boolean bool = bebidasController.cadastrarBebida(bebidaDTO);
        assertFalse(bool);
    }

}